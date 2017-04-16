package com.acne.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acne.dao.AcneImageMapper;
import com.acne.model.AcneImage;
import com.acne.service.AcneImageService;

@Service("acneImageService")
public class AcneImageServiceImpl implements AcneImageService {

	@Autowired
	AcneImageMapper acneImageMapper;

	@Override
	public void postImages(String path, Long userId) {
		acneImageMapper.postImages(path, userId);
	}

	@Override
	public List<AcneImage> getImages(Long userId) {
		return acneImageMapper.getImages(userId);
	}

}
