package com.acne.service;

import java.util.List;

import com.acne.model.AcneImage;

public interface AcneImageService {

	void postImages(String path, Long userId);

	List<AcneImage> getImages(Long userId);
}
