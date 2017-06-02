package com.acne.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acne.dao.AntiAcneUserMapper;
import com.acne.model.AntiAcneUser;
import com.acne.model.Article;
import com.acne.service.AntiUserService;

@Service("antiUserService")
public class AntiUserServiceImpl implements AntiUserService {

	@Autowired
	AntiAcneUserMapper antiAcneUserMapper;

	@Override
	public List<AntiAcneUser> queryRecommandsAntiUser() {
		List<AntiAcneUser> antiAcneUsers = antiAcneUserMapper.selectRecommands();
		return antiAcneUsers;
	}

	@Override
	public List<Article> queryPostedArticle(Long userId) {

		return null;
	}

	@Override
	public Integer queryAntiUserNum() {
		return antiAcneUserMapper.queryAntiUserNum();
	}

	@Override
	public AntiAcneUser queryAntiUserById(Long id) {
		return antiAcneUserMapper.selectByPrimaryKey(id);
	}

	@Override
	public void updateAntiUserById(AntiAcneUser antiAcneUser) {
		antiAcneUserMapper.updateByPrimaryKeySelective(antiAcneUser);
	}

}
