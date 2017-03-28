package com.acne.dao;

import java.util.List;
import java.util.Map;

import com.acne.model.AntiAcneUser;

public interface AntiAcneUserMapper {
	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_anti_user
	 *
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Long userid);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_anti_user
	 *
	 * @mbggenerated
	 */
	int insert(AntiAcneUser record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_anti_user
	 *
	 * @mbggenerated
	 */
	int insertSelective(AntiAcneUser record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_anti_user
	 *
	 * @mbggenerated
	 */
	AntiAcneUser selectByPrimaryKey(Long userid);

	AntiAcneUser selectByPhone(Map<String, Object> map);

	List<AntiAcneUser> selectRecommands();

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_anti_user
	 *
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(AntiAcneUser record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_anti_user
	 *
	 * @mbggenerated
	 */
	int updateByPrimaryKey(AntiAcneUser record);
}