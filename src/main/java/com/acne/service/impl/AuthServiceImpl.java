package com.acne.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acne.dao.AcneUserMapper;
import com.acne.dao.AntiAcneUserMapper;
import com.acne.model.AcneUser;
import com.acne.model.AntiAcneUser;
import com.acne.service.AuthService;

@Service("authService")
public class AuthServiceImpl implements AuthService {

	@Autowired
	AcneUserMapper acneUserMapper;

	@Autowired
	AntiAcneUserMapper antiAcneUserMapper;

	@Override
	public AcneUser selectByPhone(String phone, String password) {

		Map<String, Object> map = new HashMap<>();
		map.put("phone", phone);
		map.put("password", password);
		AcneUser acneUser = acneUserMapper.selectByPhone(map);
		return acneUser;
	}

	@Override
	public AntiAcneUser selectAntiByPhone(String phone, String password) {

		Map<String, Object> map = new HashMap<>();
		map.put("phone", phone);
		map.put("password", password);
		AntiAcneUser antiAcneUser = antiAcneUserMapper.selectByPhone(map);
		return antiAcneUser;
	}

}
