package com.acne.shiro;

import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;

public class UserTypeAuthenticationToken extends UsernamePasswordToken implements AuthenticationToken {
	private String userType;

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public UserTypeAuthenticationToken(String username, char[] password, String userType) {
		super(username, password, true);
		this.userType = userType;
	}

	public UserTypeAuthenticationToken(String username, char[] password, boolean rememberMe, String host,
			String userType) {
		super(username, password, rememberMe, host);
		this.userType = userType;
	}
	
	@Override
	public Object getCredentials() {
		return getPassword();
	}
	
	@Override
	public Object getPrincipal() {
		return getUsername();
	}

}
