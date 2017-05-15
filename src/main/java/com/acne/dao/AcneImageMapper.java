package com.acne.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.acne.model.AcneImage;

public interface AcneImageMapper {
	int deleteByPrimaryKey(Long imageid);
	void postImages(@Param("path") String path, @Param("userId") Long userId, @Param("desc") String desc);
	void postAvatar(@Param("path") String path, @Param("userId") Long userId);
	List<AcneImage> getImages(Long userId);
	int insert(AcneImage record);
	int insertSelective(AcneImage record);
	AcneImage selectByPrimaryKey(Long imageid);
	int updateByPrimaryKeySelective(AcneImage record);
	int updateByPrimaryKey(AcneImage record);
	List<AcneImage> queryAll();
}