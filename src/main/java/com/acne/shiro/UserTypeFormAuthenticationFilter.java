package com.acne.shiro;

import java.util.Date;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;

import com.acne.constant.Constants;
import com.acne.model.AcneUser;
import com.acne.model.AntiAcneUser;
import com.acne.service.AuthService;

public class UserTypeFormAuthenticationFilter extends FormAuthenticationFilter {

	private static final Logger logger = LoggerFactory.getLogger(UserTypeFormAuthenticationFilter.class);
	private String userTypeParam = "userType";
	private String validateCodeParam = "validateCode";

	@Autowired
	AuthService authService;

	public String getUserTypeParam() {
		return userTypeParam;
	}

	public String getValidateCodeParam() {
		return validateCodeParam;
	}

	public void setValidateCodeParam(String validateCodeParam) {
		this.validateCodeParam = validateCodeParam;
	}

	public void setUserTypeParam(String userTypeParam) {
		this.userTypeParam = userTypeParam;
	}

	protected String getValidateCode(ServletRequest request) {
		return request.getParameter(validateCodeParam);
	}

	protected String getUserType(ServletRequest request) {
		return request.getParameter(userTypeParam);
	}

	@Override
	protected UserTypeAuthenticationToken createToken(ServletRequest request, ServletResponse response) {

		String rememberMe = request.getParameter("rememberMe");

		boolean remMe = false;
		try {
			remMe = Boolean.parseBoolean(rememberMe);
		} catch (Exception e) {
			remMe = false;
		}
		String username = getUsername(request);
		String password = getPassword(request);
		String userType = getUserType(request);
		String host = getHost(request);

		logger.info("Token created info: username: {}, password: {}, userType: {}, rememberMe: {}", username, password,
				userType, remMe);

		return new UserTypeAuthenticationToken(username, password.toCharArray(), remMe, host, userType);
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {

		// 首先将ServletRequest强转成 httprequest
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;

		if (isLoginRequest(request, response)) {// 判读是否是认证的请求.是认证请求
			if (isLoginSubmission(request, response)) {// 是否是post请求
				logger.info("Login submission detected.  Attempting to execute login.");
				HttpSession session = httpServletRequest.getSession();
				// 这个是正确的验证码
				String validateCode = (String) session.getAttribute("validateCode");
				// 获得页面输入的验证码
				String randomCode = getValidateCode(httpServletRequest);
				// 判断
				if (randomCode == null || validateCode == null || !randomCode.equalsIgnoreCase(validateCode)) {
					// 校验失败的话，通过shiroLoginFailure设置到request中
					httpServletRequest.setAttribute("shiroLoginFailure", "randomCodeError");
					// 转发到登陆页面
					return true;
				}
			} else {
				logger.info("Login page view.");
			}
		} else {
			logger.info("Attempting to access a path which requires authentication. {}",
					httpServletRequest.getRequestURI());
		}

		return super.onAccessDenied(request, response);
	}

	@Override
	protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request,
			ServletResponse response) throws Exception {

		logger.info("user {} login successfully.", token.getPrincipal());

		if (token instanceof UserTypeAuthenticationToken) {
			UserTypeAuthenticationToken userTypeAuthenticationToken = (UserTypeAuthenticationToken) token;
			String userType = userTypeAuthenticationToken.getUserType();
			char[] password = userTypeAuthenticationToken.getPassword();
			String phone = userTypeAuthenticationToken.getUsername();
			Long userId = null;
			String username = null;
			String avatar = null;
			Date registerDate = null;
			String desc = null;
			Integer available = null;

			if (userType.equals(Constants.TYPE_ACNE)) {
				AcneUser acneUser = authService.selectByPhone(phone,
						DigestUtils.md5DigestAsHex(new String(password).getBytes()));

				userId = acneUser.getUserid();
				username = acneUser.getUsername();
				avatar = acneUser.getAvatar();
				registerDate = acneUser.getRegisterdate();
				desc = acneUser.getDescription();
				available = acneUser.getAvailable();
			}
			if (userType.equals(Constants.TYPE_ANTI)) {
				AntiAcneUser antiAcneUser = authService.selectAntiByPhone(phone,
						DigestUtils.md5DigestAsHex(new String(password).getBytes()));

				userId = antiAcneUser.getUserid();
				username = antiAcneUser.getUsername();
				avatar = antiAcneUser.getAvatar();
				registerDate = antiAcneUser.getRegisterdate();
				desc = antiAcneUser.getDescription();
				available = antiAcneUser.getAvailable();
			}
			Session session = subject.getSession();
			session.setAttribute("userId", userId);
			session.setAttribute("username", username);
			session.setAttribute("userType", userType);
			session.setAttribute("phone", phone);
			session.setAttribute("avatar", avatar);
			session.setAttribute("available", available);
			session.setAttribute("description", desc);
			session.setAttribute("registerDate", registerDate);
		} else {

		}

		return super.onLoginSuccess(token, subject, request, response);
	}

	@Override
	protected boolean onLoginFailure(AuthenticationToken token, AuthenticationException e, ServletRequest request,
			ServletResponse response) {
		logger.info("login failed. exception is: {}", e.getLocalizedMessage());

		return super.onLoginFailure(token, e, request, response);
	}

	@Override
	protected boolean executeLogin(ServletRequest request, ServletResponse response) throws Exception {

		UserTypeAuthenticationToken token = createToken(request, response);
		if (token == null) {
			String msg = "createToken method implementation returned null. A valid non-null AuthenticationToken "
					+ "must be created in order to execute a login attempt.";
			throw new IllegalStateException(msg);
		}
		try {
			Subject subject = getSubject(request, response);
			subject.login(token);
			return onLoginSuccess(token, subject, request, response);
		} catch (AuthenticationException e) {
			return onLoginFailure(token, e, request, response);
		}
	}

}
