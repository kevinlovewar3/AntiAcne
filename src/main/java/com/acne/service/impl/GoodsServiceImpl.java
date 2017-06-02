package com.acne.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acne.dao.GoodsMapper;
import com.acne.model.GoodsWithBLOBs;
import com.acne.service.GoodsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("goodsService")
public class GoodsServiceImpl implements GoodsService {

	@Autowired
	GoodsMapper goodsMapper;

	@Override
	public PageInfo<GoodsWithBLOBs> queryByPage(Integer pageNo, Integer pageSize) {

		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;

		PageHelper.startPage(pageNo, pageSize, true);
		List<GoodsWithBLOBs> list = goodsMapper.selectAll();
		PageInfo<GoodsWithBLOBs> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public List<GoodsWithBLOBs> queryViewedGoods(Long userId, Integer size) {
		return goodsMapper.queryViewedGoods(userId, size);
	}

	@Override
	public List<GoodsWithBLOBs> queryPostedGoods(Long userId) {
		return goodsMapper.queryPostedGoods(userId);
	}

	@Override
	public void addGoods(Long antiUserId, GoodsWithBLOBs goodsWithBLOBs) {
		goodsMapper.insertSelective(goodsWithBLOBs);
		Long goodsId = goodsWithBLOBs.getGoodsid();
		goodsMapper.insertAntiSelective(antiUserId, goodsId);
	}

	@Override
	public GoodsWithBLOBs queryGoodsByGoodsId(Long goodsId) {

		GoodsWithBLOBs goodsWithBLOBs = goodsMapper.selectByPrimaryKey(goodsId);

		return goodsWithBLOBs;
	}

	@Override
	public void deleteGoods(Long goodsId) {
		goodsMapper.deleteByPrimaryKey(goodsId);
	}
}
