package com.acne.service;

import com.acne.model.AcneUser;
import com.acne.model.AntiAcneUser;

public interface AuthService {

	public AcneUser selectByPhone(String phone, String password);

	public AntiAcneUser selectAntiByPhone(String phone, String password);

}
