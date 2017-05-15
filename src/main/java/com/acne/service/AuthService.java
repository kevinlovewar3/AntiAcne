package com.acne.service;

import com.acne.model.AcneUser;
import com.acne.model.AntiAcneUser;
import com.acne.model.ValidatorImage;

public interface AuthService {

	public AcneUser selectByPhone(String phone, String password);

	public AntiAcneUser selectAntiByPhone(String phone, String password);

	public AcneUser isAcneUserExist(String phone);

	public AntiAcneUser isAntiAcneUser(String phone);

	public void updateByPrimaryKeySelective(AcneUser acneUser);
	
	public void registerAcneUser(AcneUser acneUser);
	
	public void registerAntiUser(AntiAcneUser antiAcneUser);
	
	public ValidatorImage selectValidatorImageById();
}
