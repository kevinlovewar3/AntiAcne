package com.acne.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.acne.model.Article;

public interface ArticleMapper {

	List<Article> selectRecommands(Integer size);

	ArrayList<Article> selectAll();

	Map<String, Object> selectAntiUserArticleByPrimaryKey(Long articleId);

	List<Article> queryViewedArticles(@Param("userId") Long userId, @Param("size") Integer size);

	public List<Article> queryArticleByAntiUser(@Param("articleId") Long articleId);

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