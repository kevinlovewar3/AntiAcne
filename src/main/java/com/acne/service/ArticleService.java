package com.acne.service;

import java.util.List;
import java.util.Map;

import com.acne.model.Article;
import com.github.pagehelper.PageInfo;

public interface ArticleService {

	// List<Article> selectAll();

	PageInfo<Article> queryByPage(Integer pageNo, Integer pageSize);

	List<Article> queryRecommandArticles(Integer size);

	Map<String, Object> selectAntiUserArticleByPrimaryKey(Long articleId);
	
	int postArticleHist(Article article);
	
	List<Article> queryViewedArticles(Long userId, Integer size);
	
	List<Article> queryArticleByAntiUser(Long articleId);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_article
	 *
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Long articleid);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_article
	 *
	 * @mbggenerated
	 */
	int insert(Article record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_article
	 *
	 * @mbggenerated
	 */
	int insertSelective(Article record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_article
	 *
	 * @mbggenerated
	 */
	Article selectByPrimaryKey(Long articleid);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_article
	 *
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(Article record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_article
	 *
	 * @mbggenerated
	 */
	int updateByPrimaryKeyWithBLOBs(Article record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds
	 * to the database table t_article
	 *
	 * @mbggenerated
	 */
	int updateByPrimaryKey(Article record);
}
