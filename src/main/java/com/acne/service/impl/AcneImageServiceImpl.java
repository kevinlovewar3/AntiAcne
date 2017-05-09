package com.acne.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acne.dao.AcneImageMapper;
import com.acne.model.AcneImage;
import com.acne.service.AcneImageService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

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

	@Override
	public void postAvatar(String path, Long userId) {
		acneImageMapper.postAvatar(path, userId);
	}

	@Override
	public void updateAcneImage(AcneImage acneImage) {
		acneImageMapper.updateByPrimaryKeySelective(acneImage);
	}

	@Override
	public void deleteAcneImage(Long imageId) {
		acneImageMapper.deleteByPrimaryKey(imageId);
	}

	@Override
	public PageInfo<AcneImage> queryByPage(Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 9 : pageSize;
		PageHelper.startPage(pageNo, pageSize);
		List<AcneImage> list = acneImageMapper.queryAll();
		PageInfo<AcneImage> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

}
