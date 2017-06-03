package com.acne.service;

import java.util.List;

import com.acne.model.GoodsWithBLOBs;
import com.github.pagehelper.PageInfo;

public interface GoodsService {

	PageInfo<GoodsWithBLOBs> queryByPage(Integer pageNo, Integer pageSize);

	List<GoodsWithBLOBs> queryViewedGoods(Long userId, Integer size);

	List<GoodsWithBLOBs> queryPostedGoods(Long userId);

	GoodsWithBLOBs queryGoodsByGoodsId(Long goodsId);

	void addGoods(Long antiUserId, GoodsWithBLOBs goodsWithBLOBs);
	
	void deleteGoods(Long goodsId);

}
