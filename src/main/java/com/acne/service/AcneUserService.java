package com.acne.service;

public interface AcneUserService {

	public void insertViewedArticle(Long articleId, Long userId);

	public void insertViewedGoods(Long goodsId, Long userId);
}
