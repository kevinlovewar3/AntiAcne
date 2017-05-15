package com.acne.service;

import java.util.List;

import com.acne.model.AcneImage;
import com.github.pagehelper.PageInfo;

public interface AcneImageService {

	void postImages(String path, Long userId, String desc);

	void postAvatar(String path, Long userId);

	List<AcneImage> getImages(Long userId);

	void updateAcneImage(AcneImage acneImage);

	void deleteAcneImage(Long imageId);

	PageInfo<AcneImage> queryByPage(Integer pageNo, Integer pageSize);
}
