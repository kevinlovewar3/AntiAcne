package com.acne.service;

import java.util.List;

import com.acne.model.AntiAcneUser;
import com.acne.model.Article;

public interface AntiUserService {

	List<AntiAcneUser> queryRecommandsAntiUser();
	
	List<Article> queryPostedArticle(Long userId);
	
	Integer queryAntiUserNum();
}
