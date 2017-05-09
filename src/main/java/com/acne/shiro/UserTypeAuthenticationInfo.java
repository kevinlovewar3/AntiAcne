package com.acne.shiro;

import org.apache.shiro.authc.SimpleAuthenticationInfo;

import com.acne.constant.Constants;

public class UserTypeAuthenticationInfo extends SimpleAuthenticationInfo {

	public UserTypeAuthenticationInfo(Object principal, Object credentials, String realmName, String userType) {
		super(principal, credentials, realmName);
		setUserType(userType);
	}

	private String userType = Constants.TYPE_ACNE;

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

}
