package com.acne.service.impl;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import com.acne.constant.Constants;
import com.acne.model.AcneUser;
import com.acne.model.AntiAcneUser;
import com.acne.service.AuthService;
import com.acne.shiro.UserTypeAuthenticationInfo;
import com.acne.shiro.UserTypeAuthenticationToken;

@Transactional
public class AcneShiro extends AuthorizingRealm {

	@Autowired
	AuthService authService;

	private static final Logger logger = LoggerFactory.getLogger(AcneShiro.class);

	/**
	 * 权限认证
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
		return null;
	}

	/**
	 * 登陆认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		
		if (token instanceof UserTypeAuthenticationToken) {
			UserTypeAuthenticationToken userTypeAuthenticationToken = (UserTypeAuthenticationToken) token;
			String userType = userTypeAuthenticationToken.getUserType();
			String username = userTypeAuthenticationToken.getUsername();
			String password = new String(userTypeAuthenticationToken.getPassword());
			password = DigestUtils.md5DigestAsHex(password.getBytes());
			
			if (userType.equals(Constants.TYPE_ACNE)) {
				AcneUser acneUser = authService.selectByPhone(username, password);
				if (acneUser != null) {
					AuthenticationInfo authenticationInfo = new UserTypeAuthenticationInfo(acneUser.getPhone(),
							password, getName(), userType);
					return authenticationInfo;
				} else
					return null;

			} else if (userType.equals(Constants.TYPE_ANTI)) {
				AntiAcneUser antiAcneUser = authService.selectAntiByPhone(username, password);
				if (antiAcneUser != null) {
					AuthenticationInfo authenticationInfo = new UserTypeAuthenticationInfo(antiAcneUser.getPhone(),
							password, getName(), userType);
					
					return authenticationInfo;
				} else
					return null;
			} else {
				return null;
			}
		} else {
			logger.info("param token is not type of UserTypeAuthenticationToken. ");
			return null;
		}
	}

}
