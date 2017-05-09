package com.acne.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.ExpiredCredentialsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acne.constant.Constants;
import com.acne.model.AcneUser;
import com.acne.model.AntiAcneUser;
import com.acne.service.AuthService;
import com.acne.shiro.UserTypeAuthenticationToken;
import com.acne.util.ObjectUtil;
import com.taobao.api.ApiException;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.AlibabaAliqinFcSmsNumSendRequest;
import com.taobao.api.response.AlibabaAliqinFcSmsNumSendResponse;

@Controller
@RequestMapping(value = "/")
public class AuthController {

	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);

	@Autowired
	AuthService authService;

	private static final String MSG_SUCCESS = "{\"message\":\"success\"}";

	private static final String MSG_PHONE = "{\"message\":\"phone number is unavailable.\"}";
	private static final String MSG_PASSWORD = "{\"message\":\"password is unavailable.\"}";
	private static final String MSG_NOUSERTYPE = "{\"message\":\"user type is unavailable.\"}";
	private static final String MSG_NO_USER = "{\"message\":\"no user find.\"}";

	// 已注册
	private static final String MSG_REGISTERED = "{\"message\":\"Sorry already registered!\"}";

	private static final String MSG_ERROR_VERIFY_CODE = "{\"message\": \"varified code error\"}";
	private static final String MSG_ERROR_USERTYPE = "{\"message\": \"user type error\"}";

	private static final String TYPE_ACNE = "acne_user";
	private static final String TYPE_ANTI = "anti_user";

	/**
	 * 登录
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public ModelAndView postLogin(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mView = new ModelAndView();
		String phone = request.getParameter("username");
		String password = request.getParameter("password");
		password = DigestUtils.md5DigestAsHex(password.getBytes());
		String userType = request.getParameter("userType");
		String rememberMe = request.getParameter("rememberMe");

		boolean remMe = false;
		try {
			remMe = Boolean.parseBoolean(rememberMe);
		} catch (Exception e) {
			remMe = false;
		}
		
		logger.info("parameters username: {}, password: {}, userType: {}", phone, password, userType);

		UserTypeAuthenticationToken token = new UserTypeAuthenticationToken(phone, password.toCharArray(), userType);
		token.setRememberMe(true);
		Subject subject = SecurityUtils.getSubject();
		String msg = null;
		try {
			if (subject.isAuthenticated()) {
				mView.setViewName("index");
				return mView;
			} 
			
			token.setRememberMe(remMe);
			subject.login(token);
		} catch (IncorrectCredentialsException e) {
			msg = "登录密码错误. Password for account " + token.getPrincipal() + " was incorrect.";
			logger.info("{}\n IncorrectCredentialsException: {}", msg, e);
		} catch (ExcessiveAttemptsException e) {
			msg = "登录失败次数过多";
			logger.info("{}\n ExcessiveAttemptsException: {}", msg, e);
		} catch (LockedAccountException e) {
			msg = "帐号已被锁定. The account for username " + token.getPrincipal() + " was locked.";
			logger.info("{}\n LockedAccountException: {}", msg, e);
		} catch (DisabledAccountException e) {
			msg = "帐号已被禁用. The account for username " + token.getPrincipal() + " was disabled.";	
			logger.info("{}\n DisabledAccountException: {}", msg, e);
		} catch (ExpiredCredentialsException e) {
			msg = "帐号已过期. the account for username " + token.getPrincipal() + "  was expired.";
			logger.info("{}\n ExpiredCredentialsException: {}", msg, e);
		} catch (UnknownAccountException e) {
			msg = "帐号不存在. There is no user with username of " + token.getPrincipal();
			logger.info("{}\n UnknownAccountException: {}", msg, e);
		} catch (UnauthorizedException e) {
			msg = "您没有得到相应的授权！" + e.getMessage();
			logger.info("{}\n UnauthorizedException: {}", msg, e);
		}
		mView.setViewName("auth");
		mView.addObject("message", msg);
		return mView;
	}

	/**
	 * 获取登录界面
	 * 
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mView = new ModelAndView("auth");
		HttpSession session = request.getSession();
		session.setAttribute("", "");
		return mView;
	}

	/**
	 * 发送注册验证码
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws ApiException
	 */
	@RequestMapping(value = "send_code", method = RequestMethod.GET)
	@ResponseBody
	public String sendCode(HttpServletRequest request, HttpServletResponse response) throws ApiException {
		String phone = request.getParameter("phone");
		String userType = request.getParameter("userType");

		logger.info("phone: {}, userType: {}", phone, userType);

		if (userType.equalsIgnoreCase(Constants.TYPE_ACNE)) {
			AcneUser acneUser = authService.isAcneUserExist(phone);

			logger.info("acneUser: {}", acneUser);

			if (acneUser != null && acneUser.getPhone() != null) {
				return MSG_REGISTERED;
			}
		} else if (userType.equalsIgnoreCase(Constants.TYPE_ANTI)) {
			AntiAcneUser antiAcneUser = authService.isAntiAcneUser(phone);

			logger.info("antiAcneUser: {}", antiAcneUser);
			if (antiAcneUser != null && antiAcneUser.getPhone() != null) {

				return MSG_REGISTERED;
			}
		}

		response.setContentType("application/x-javascript");
		Random random = new Random();
		String srand = "";
		for (int i = 0; i < 4; i++) {
			String rand = String.valueOf(random.nextInt(10));
			srand += rand;
		}

		TaobaoClient client = new DefaultTaobaoClient("http://gw.api.taobao.com/router/rest", "23731850",
				"d37bc56b18471de009a1c3016b69f8c2");
		AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
		req.setExtend(phone);
		req.setSmsType("normal");
		req.setSmsFreeSignName("美肤");
		req.setSmsParamString("{\"name\":\"" + srand + "\"}");
		req.setRecNum(phone);
		req.setSmsTemplateCode("SMS_59950085");
		AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
		System.out.println(rsp.getBody());

		HttpSession session = request.getSession();
		session.setAttribute("code", srand);
		response.setContentType("application/json;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		// TODO if rsp.getBody is success
		// send success to user
		return rsp.getBody();
	}

	@RequestMapping(value = "register_no_verify", method = RequestMethod.POST, produces = {
			"application/json; charset=UTF-8" })
	@ResponseBody
	public String register_no_verify(HttpServletRequest request, HttpServletResponse response) {
		String userType = request.getParameter("userType");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");

		if (userType == null || userType.equals(Constants.TYPE_ACNE)) {
			AcneUser acneUser = new AcneUser();
			acneUser.setUsername("");
			acneUser.setPhone(phone);
			acneUser.setPassword(password);
			acneUser.setAvailable(1);
			acneUser.setRegisterdate(new Date());
			acneUser.setDescription("新晋美肤成员一枚");
			authService.registerAcneUser(acneUser);
		} else if (userType.equals(Constants.TYPE_ANTI)) {
			AntiAcneUser antiAcneUser = new AntiAcneUser();
			antiAcneUser.setUsername("");
			antiAcneUser.setAvailable(1);
			antiAcneUser.setPhone(phone);
			antiAcneUser.setRegisterdate(new Date());
			antiAcneUser.setDescription("新晋美肤大人一枚");
			authService.registerAntiUser(antiAcneUser);
		} else {
			return MSG_ERROR_USERTYPE;
		}

		return MSG_SUCCESS;
	}

	/**
	 * 注册
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "register", method = RequestMethod.POST, produces = { "application/json; charset=UTF-8" })
	@ResponseBody
	public String register(HttpServletRequest request, HttpServletResponse response) {

		String code = request.getParameter("code");
		String userType = request.getParameter("userType");
		String phone = request.getParameter("phone");
		String password = request.getParameter("password");

		Object codeLastObj = request.getSession().getAttribute("code");
		String codeLast = ObjectUtil.ObjectToString(codeLastObj);
		if (code.equalsIgnoreCase(codeLast)) {
			if (userType.equals(Constants.TYPE_ACNE)) {
				AcneUser acneUser = new AcneUser();
				acneUser.setPhone(phone);
				acneUser.setPassword(password);
				acneUser.setAvailable(1);
				acneUser.setRegisterdate(new Date());
				acneUser.setDescription("新晋美肤成员一枚");
				authService.registerAcneUser(acneUser);
			} else if (userType.equals(Constants.TYPE_ANTI)) {
				AntiAcneUser antiAcneUser = new AntiAcneUser();
				antiAcneUser.setAvailable(1);
				antiAcneUser.setPhone(phone);
				antiAcneUser.setRegisterdate(new Date());
				antiAcneUser.setDescription("新晋美肤大人一枚");
				authService.registerAntiUser(antiAcneUser);
			} else {
				return MSG_ERROR_USERTYPE;
			}
		} else {
			return MSG_ERROR_VERIFY_CODE;
		}

		return MSG_SUCCESS;
	}

	/**
	 * 完善个人信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "complete", method = RequestMethod.POST, produces = { "application/json; charset=UTF-8" })
	@ResponseBody
	public String complete(HttpServletRequest request, HttpServletResponse response) {

		String sex = request.getParameter("sex");
		String skinType = request.getParameter("skinType");
		String ageStr = request.getParameter("age");
		String spanTimeStr = request.getParameter("spanTime");
		String desc = request.getParameter("desc");
		Integer age = (ageStr == null || ageStr.length() == 0) ? null : Integer.parseInt(ageStr);
		Integer spanTime = (spanTimeStr == null || spanTimeStr.length() == 0) ? null : Integer.parseInt(spanTimeStr);

		String userid = request.getSession().getAttribute("userId").toString();
		AcneUser acneUser = new AcneUser();
		acneUser.setUserid(Long.parseLong(userid));
		acneUser.setSex(sex);
		acneUser.setSkintype(skinType);
		acneUser.setAge(age);
		acneUser.setAcnetimespan(spanTime);
		acneUser.setDescription(desc);

		authService.updateByPrimaryKeySelective(acneUser);
		return MSG_SUCCESS;
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	@ResponseBody
	public void logout(HttpServletRequest request, HttpServletResponse response) {

		// String userType =
		// request.getSession().getAttribute("userType").toString();
		// String username =
		// request.getSession().getAttribute("username").toString();
		// String phone = request.getSession().getAttribute("phone").toString();
		// request.getSession().removeAttribute(userType);
		// request.getSession().removeAttribute(username);
		// request.getSession().removeAttribute(phone);
		request.getSession().invalidate();
		try {
			response.sendRedirect("/acne");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
