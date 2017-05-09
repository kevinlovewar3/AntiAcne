package com.acne.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acne.dao.ArticleMapper;
import com.acne.model.Article;
import com.acne.service.ArticleService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	ArticleMapper articleMapper;

	@Override
	public int deleteByPrimaryKey(Long articleid) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Article record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public long insertSelective(Long userId, Article record) {
		articleMapper.insertSelective(record);
		long articleId = record.getArticleid();
		articleMapper.insertAntiArticle(userId, articleId);
		return articleId;
	}

	@Override
	public Article selectByPrimaryKey(Long articleid) {
		return articleMapper.selectByPrimaryKey(articleid);
	}

	@Override
	public int updateByPrimaryKeySelective(Article record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKeyWithBLOBs(Article record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Article record) {
		// TODO Auto-generated method stub
		return 0;
	}

	// @Override
	// public List<Article> selectAll() {
	// // TODO Auto-generated method stub
	// return null;
	// }

	@Override
	public PageInfo<Article> queryByPage(Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 10 : pageSize;

		PageHelper.startPage(pageNo, pageSize, true);
		ArrayList<Article> list = articleMapper.selectAll();
		PageInfo<Article> pageInfo = new PageInfo<Article>(list);
		return pageInfo;
	}

	@Override
	public List<Article> queryRecommandArticles(Integer size) {
		size = size == null ? 10 : size;
		List<Article> list = articleMapper.selectRecommands(size);
		return list;
	}

	@Override
	public Map<String, Object> selectAntiUserArticleByPrimaryKey(Long articleId) {
		Map<String, Object> map = articleMapper.selectAntiUserArticleByPrimaryKey(articleId);
		return map;
	}

	@Override
	public int postArticleHist(Article article) {
		return articleMapper.updateByPrimaryKeySelective(article);
	}

	@Override
	public List<Article> queryViewedArticles(Long userId, Integer size) {
		return articleMapper.queryViewedArticles(userId, size);
	}

	@Override
	public List<Article> queryMoreArticleByArticleId(Long articleId) {
		return articleMapper.queryMoreArticleByArticleId(articleId);
	}

	@Override
	public List<Article> queryPostedArticle(Long userId) {
		return articleMapper.queryPostedArticle(userId);
	}

}
