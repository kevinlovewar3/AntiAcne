package com.acne.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.acne.model.Goods;
import com.acne.model.GoodsWithBLOBs;

public interface GoodsMapper {
	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_goods
	 *
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Long goodsid);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_goods
	 *
	 * @mbggenerated
	 */
	int insert(GoodsWithBLOBs record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_goods
	 *
	 * @mbggenerated
	 */
	int insertSelective(GoodsWithBLOBs record);

	int insertAntiSelective(@Param("antiUserId") Long antiUserId, @Param("goodsId") Long goodsId);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_goods
	 *
	 * @mbggenerated
	 */
	GoodsWithBLOBs selectByPrimaryKey(Long goodsid);

	List<GoodsWithBLOBs> queryViewedGoods(@Param("userId") Long userId, @Param("size") Integer size);

	List<GoodsWithBLOBs> selectAll();

	List<GoodsWithBLOBs> queryPostedGoods(Long userId);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_goods
	 *
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(GoodsWithBLOBs record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_goods
	 *
	 * @mbggenerated
	 */
	int updateByPrimaryKeyWithBLOBs(GoodsWithBLOBs record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_goods
	 *
	 * @mbggenerated
	 */
	int updateByPrimaryKey(Goods record);
}