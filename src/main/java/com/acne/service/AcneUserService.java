package com.acne.service;

import com.acne.model.AcneUser;
import com.github.pagehelper.PageInfo;

public interface AcneUserService {
	
	public AcneUser queryAcneUserByUserId(Long userId);

	public void insertViewedArticle(Long articleId, Long userId);

	public void insertViewedGoods(Long goodsId, Long userId);

	public PageInfo<AcneUser> queryByPage(Integer pageNo, Integer pageSize);
	
	public String queryAvatarByUserId(Long userId);
	
	Integer queryAcneUserNum();
}
