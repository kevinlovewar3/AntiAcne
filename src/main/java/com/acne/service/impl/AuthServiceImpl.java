package com.acne.service.impl;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acne.dao.AcneUserMapper;
import com.acne.dao.AntiAcneUserMapper;
import com.acne.model.AcneUser;
import com.acne.model.AntiAcneUser;
import com.acne.model.ValidatorImage;
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

	@Override
	public AcneUser isAcneUserExist(String phone) {
		AcneUser acneUser = acneUserMapper.isAcneUserExist(phone);
		return acneUser;
	}

	@Override
	public AntiAcneUser isAntiAcneUser(String phone) {
		AntiAcneUser antiAcneUser = antiAcneUserMapper.isAntiAcneUserExist(phone);
		return antiAcneUser;
	}

	@Override
	public void updateByPrimaryKeySelective(AcneUser acneUser) {
		acneUserMapper.updateByPrimaryKeySelective(acneUser);
	}

	@Override
	public void registerAcneUser(AcneUser acneUser) {
		acneUserMapper.insertSelective(acneUser);
	}

	@Override
	public void registerAntiUser(AntiAcneUser antiAcneUser) {
		antiAcneUserMapper.insertSelective(antiAcneUser);
	}

	@Override
	public ValidatorImage selectValidatorImageById() {
		String validatorString = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		StringBuilder builder = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < 4; i++) {
			int next = random.nextInt(validatorString.length());
			char ch = validatorString.charAt(next);
			builder.append(ch);
		}
		ValidatorImage validatorImage = new ValidatorImage();
		validatorImage.setValidatorname(builder.toString());
		validatorImage.setValidatorvalue(builder.toString());
		return validatorImage;
	}

}
