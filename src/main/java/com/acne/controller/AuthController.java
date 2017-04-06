package com.acne.controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acne.constant.Constants;
import com.acne.model.AcneUser;
import com.acne.model.AntiAcneUser;
import com.acne.service.AuthService;
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

	// ÒÑ×¢²á
	private static final String MSG_REGISTERED = "{\"message\":\"±§Ç¸£¬¸ÃºÅÂëÒÑ×¢²á!\"}";

	private static final String TYPE_ACNE = "acne_user";
	private static final String TYPE_ANTI = "anti_user";

	/**
	 * µÇÂ¼
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView postLogin(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mView = new ModelAndView("auth");

		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String userType = request.getParameter("userType");

		if (StringUtils.isEmpty(phone) || phone.trim().length() != 11) {
			mView.addObject("result", MSG_PHONE);
			return mView;
		}
		if (StringUtils.isEmpty(password)) {
			mView.addObject("result", MSG_PASSWORD);
			return mView;
		}
		if (StringUtils.isEmpty(userType)) {
			mView.addObject("result", MSG_NOUSERTYPE);
			return mView;
		}
		password = DigestUtils.md5DigestAsHex(password.getBytes());
		if (userType.equalsIgnoreCase(TYPE_ACNE)) {
			AcneUser acneUser = authService.selectByPhone(phone, password);
			if (acneUser == null) {
				mView.addObject("result", MSG_NO_USER);
				return mView;
			}

			logger.info("login user: {}", acneUser);

			JSONObject acneUserJsonObj = new JSONObject(acneUser);
			mView.addObject("result", acneUserJsonObj);
			mView.addObject("userType", TYPE_ACNE);
		} else if (userType.equalsIgnoreCase(TYPE_ANTI)) {
			AntiAcneUser antiAcneUser = authService.selectAntiByPhone(phone, password);
			if (antiAcneUser == null) {
				mView.addObject("result", MSG_NO_USER);
				return mView;
			}

			logger.info("anti acne user: {}", antiAcneUser);

			JSONObject antiUserJsonObj = new JSONObject(antiAcneUser);
			mView.addObject("result", antiUserJsonObj);
			mView.addObject("userType", TYPE_ANTI);
		} else {
			mView.addObject("result", MSG_NOUSERTYPE);
			return mView;
		}

		return mView;
	}

	/**
	 * »ñÈ¡µÇÂ¼½çÃæ
	 * 
	 * @return
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getLogin() {
		ModelAndView mView = new ModelAndView("auth");
		return mView;
	}

	/**
	 * ·¢ËÍ×¢²áÑéÖ¤Âë
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
		if (userType.equalsIgnoreCase(Constants.TYPE_ACNE)) {
			AcneUser acneUser = authService.isAcneUserExist(phone);
			if (acneUser != null) {
				return MSG_REGISTERED;
			}
		} else if (userType.equalsIgnoreCase(Constants.TYPE_ANTI)) {
			AntiAcneUser antiAcneUser = authService.isAntiAcneUser(phone);
			if (antiAcneUser != null) {
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
		req.setSmsFreeSignName("ÃÀ·ô");
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

	/**
	 * ×¢²á
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "register", method = RequestMethod.POST, produces = { "application/json; charset=UTF-8" })
	@ResponseBody
	public String register(HttpServletRequest request, HttpServletResponse response) {

		String code = request.getParameter("code");
		Object codeLast = request.getSession().getAttribute("code");
		if (null == codeLast) {

		}

		return null;
	}

	@RequestMapping(value = "complete", method = RequestMethod.POST, produces = { "application/json; charset=UTF-8" })
	@ResponseBody
	public String complete(HttpServletRequest request, HttpServletResponse response) {

		String sex = request.getParameter("sex");
		String skinType = request.getParameter("skinType");
		String ageStr = request.getParameter("age");
		String spanTimeStr = request.getParameter("spanTime");
		Integer age = (ageStr == null || ageStr.length() == 0) ? null : Integer.parseInt(ageStr);
		Integer spanTime = (spanTimeStr == null || spanTimeStr.length() == 0) ? null : Integer.parseInt(spanTimeStr);

		String userid = request.getSession().getAttribute("userId").toString();
		AcneUser acneUser = new AcneUser();
		acneUser.setUserid(Long.parseLong(userid));
		acneUser.setSex(sex);
		acneUser.setSkintype(skinType);
		acneUser.setAge(age);
		acneUser.setAcnetimespan(spanTime);

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
