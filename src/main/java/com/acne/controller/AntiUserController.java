package com.acne.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acne.model.AntiAcneUser;
import com.acne.model.Article;
import com.acne.service.AntiUserService;
import com.acne.service.ArticleService;
import com.acne.util.StringUtil;

@Controller
@RequestMapping(value = "/")
public class AntiUserController {

	private static final Logger logger = LoggerFactory.getLogger(AntiUserController.class);

	@Autowired
	AntiUserService antiUserService;

	@Autowired
	ArticleService articleService;

	/**
	 * 治痘达人首页
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "antiuser", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView antiUser(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mView = new ModelAndView("antiuser");
		return mView;
	}

	/**
	 * 推荐治痘达人界面
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "anti_recommands", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView antiRecommands(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mView = new ModelAndView("acneuser_recommand");
		List<AntiAcneUser> antiAcneUsers = antiUserService.queryRecommandsAntiUser();

		logger.info("Get anti/recommands, result: {}", antiAcneUsers);
		
		mView.addObject("antiUser", antiAcneUsers);
		return mView;
	}

	/**
	 * 为患者推荐的治痘达人
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "anti/recommands", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	@ResponseBody
	public String recommands(HttpServletRequest request, HttpServletResponse response) {

		List<AntiAcneUser> antiUsers = antiUserService.queryRecommandsAntiUser();
		JSONArray antiJsonUsers = new JSONArray(antiUsers);

		logger.info("Get anti/recommands, result: {}", antiJsonUsers);

		return antiJsonUsers.toString();
	}

	/**
	 * 根据文章ID获取作者的其它文章
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "anti/article_list", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	@ResponseBody
	public String articleList(HttpServletRequest request, HttpServletResponse response) {

		String articleIdStr = request.getParameter("articleId");
		Long articleId = Long.parseLong(articleIdStr);
		List<Article> articles = articleService.queryMoreArticleByArticleId(articleId);
		JSONArray articlesJson = new JSONArray(articles);

		logger.info("Get anti/article_list, result: {}", articlesJson);

		return articlesJson.toString();
	}
	
	@RequestMapping(value = "anti_home", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView antiHome(HttpServletRequest request, HttpServletResponse response){
		
		String antiUserIdStr = request.getParameter("antiUserId");
		Long antiUserId = StringUtil.StringToLong(antiUserIdStr);
		ModelAndView mView = new ModelAndView("anti_home");
		mView.addObject("antiUserId", antiUserId);
		
		return mView;
	}
	
	
	
	
	
	
	
}
