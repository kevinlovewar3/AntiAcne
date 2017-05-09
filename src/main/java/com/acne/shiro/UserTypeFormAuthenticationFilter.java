package com.acne.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UserTypeFormAuthenticationFilter extends FormAuthenticationFilter {

	private static final Logger logger = LoggerFactory.getLogger(UserTypeFormAuthenticationFilter.class);
	private String userTypeParam = "userType";

	public String getUserTypeParam() {
		return userTypeParam;
	}

	public void setUserTypeParam(String userTypeParam) {
		this.userTypeParam = userTypeParam;
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
	protected boolean executeLogin(ServletRequest request, ServletResponse response) throws Exception {
		UserTypeAuthenticationToken token = createToken(request, response);

		try {
			Subject subject = getSubject(request, response);
			subject.login(token);
			logger.info("login successfully.");
			return onLoginSuccess(token, subject, request, response);
		} catch (AuthenticationException e) {
			logger.info("login failed. exception is: {}", e);
			return onLoginFailure(token, e, request, response);
		}
	}

}
