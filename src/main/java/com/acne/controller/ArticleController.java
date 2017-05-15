package com.acne.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acne.application.AcneApplicationCtx;
import com.acne.constant.Constants;
import com.acne.model.Article;
import com.acne.service.AcneUserService;
import com.acne.service.ArticleService;
import com.acne.util.ObjectUtil;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value = "/")
public class ArticleController {

	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);

	private static final String MSG_NO_ARTICLEID = "{\"message\":\"no article id.\"}";
	private static final String MSG_FAILED = "{\"message\":\"failed.\"}";
	private static final String MSG_SUCCESS = "{\"message\":\"success.\"}";

	@Autowired
	ArticleService articleService;

	@Autowired
	AcneUserService acneUserService;

	@Autowired
	AcneApplicationCtx applicationCtx;

	/**
	 * 获取多页的博文
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getArticles(HttpServletRequest request, HttpServletResponse response) {

		String pageNoStr = request.getParameter("pageNo");
		String pageSizeStr = request.getParameter("pageSize");

		Integer pageNo = StringUtils.isEmpty(pageNoStr) ? 1 : Integer.parseInt(pageNoStr);
		Integer pageSize = StringUtils.isEmpty(pageSizeStr) ? 9 : Integer.parseInt(pageSizeStr);

		PageInfo<Article> articles = articleService.queryByPage(pageNo, pageSize);
		List<Article> list = articles.getList();
		int pages = articles.getPages();
		Integer acneNum = applicationCtx.getAcneNum();
		Integer antiNum = applicationCtx.getAntiNum();

		logger.info("Total num: {}, current: {}, PageInfo<Article>: {}, AcneNum: {}, AntiNum: {}", pages, pageNo,
				articles, acneNum, antiNum);

		ModelAndView mView = new ModelAndView();
		mView.addObject("acneNum", acneNum);
		mView.addObject("antiNum", antiNum);
		mView.setViewName("index");
		mView.addObject("articles", list);
		mView.addObject("pages", pages);
		mView.addObject("current", pageNo);
		return mView;
	}

	/**
	 * 获取今日推荐博文
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "recommands", method = RequestMethod.GET, produces = { "application/json; charset=UTF-8" })
	@ResponseBody
	public String getRecommandArticles(HttpServletRequest request, HttpServletResponse response) {
		String sizeStr = request.getParameter("size");
		Integer size = sizeStr == null ? 10 : Integer.parseInt(sizeStr);
		List<Article> list = articleService.queryRecommandArticles(size);
		JSONArray array = new JSONArray(list);
		return array.toString();
	}

	/**
	 * 提交博文
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "article", method = RequestMethod.POST)
	@ResponseBody
	public String postArticles(HttpServletRequest request, HttpServletResponse response) {
		Object userIdObj = request.getSession().getAttribute("userId");
		Object userTypeObj = request.getSession().getAttribute("userType");
		Long userId = ObjectUtil.ObjectToLong(userIdObj);
		String userType = ObjectUtil.ObjectToString(userTypeObj);
		if (userId == Long.MIN_VALUE || userType.equals(Constants.TYPE_ACNE)) {
			return MSG_FAILED;
		}

		if (userType.equals(Constants.TYPE_ANTI)) {
			String blog = request.getParameter("blog");
			String title = request.getParameter("title");

			Article article = new Article();
			article.setAvailable(1);
			article.setContent(blog);
			article.setTitle(title);
			article.setUptimes(0);
			article.setViewtimes(0);
			article.setDowntimes(0);
			article.setPublishdate(new Date());

			long articleId = articleService.insertSelective(userId, article);

			logger.info("inserted article with articleId: {}", articleId);
			return MSG_SUCCESS;
		}
		return MSG_FAILED;
	}

	/**
	 * 祛痘达人 编写博文
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "post_article", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView postArticle(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mView = new ModelAndView("antiuser_postarticle");
		return mView;
	}

	/**
	 * 已发表博文
	 */
	@RequestMapping(value = "posted_article", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	@ResponseBody
	public String postedArticle(HttpServletRequest request, HttpServletResponse response) {
		String userIdStr = request.getSession().getAttribute("userId").toString();
		Long userId = Long.parseLong(userIdStr);
		List<Article> articles = articleService.queryPostedArticle(userId);
		JSONArray array = new JSONArray(articles);

		logger.info("Total num: PageInfo<Article>: {}", articles);

		return array.toString();
	}

	/**
	 * 获取博文详情
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "article", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getArticle(HttpServletRequest request, HttpServletResponse response) {
		String articleIdStr = request.getParameter("articleId");
		Long articleId = articleIdStr == null ? 0L : Long.parseLong(articleIdStr);
		Map<String, Object> map = articleService.selectAntiUserArticleByPrimaryKey(articleId);

		logger.info("Get article: {}", map);

		ModelAndView mView = new ModelAndView("article");
		mView.addObject("article", map);
		return mView;
	}

	/**
	 * 获取浏览历史记录
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "article_hist", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	@ResponseBody
	public String getArticleHist(HttpServletRequest request, HttpServletResponse response) {
		String userIdStr = request.getParameter("userId");
		Integer size = null;
		Long userId = null;
		if (userIdStr != null) {
			userId = Long.parseLong(userIdStr);
		}
		size = 5;

		List<Article> articles = articleService.queryViewedArticles(userId, size);
		logger.info("Viewed articles: {}", articles);
		JSONArray array = new JSONArray(articles);
		return array.toString();
	}

	/**
	 * 赞一个 踩一下
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "article/option", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	@ResponseBody
	public String articleOption(HttpServletRequest request, HttpServletResponse response) {
		return postArticleHist(request, response);
	}

	/**
	 * 更新浏览记录
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "article_hist", method = RequestMethod.POST)
	@ResponseBody
	public String postArticleHist(HttpServletRequest request, HttpServletResponse response) {
		String articleIdStr = request.getParameter("articleId");
		String viewTimeStr = request.getParameter("viewTimes");
		String upTimeStr = request.getParameter("upTimes");
		String downTimeStr = request.getParameter("downTimes");
		String userIdStr = request.getParameter("userId");
		String userType = request.getParameter("userType");
		Long articleId = null;
		Integer viewTimes = null;
		Integer upTimes = null;
		Integer downTimes = null;
		Article article = new Article();
		if (articleIdStr == null) {
			return MSG_NO_ARTICLEID;
		} else {
			articleId = Long.parseLong(articleIdStr);
			article.setArticleid(articleId);
		}
		if (viewTimeStr != null) {
			viewTimes = Integer.parseInt(viewTimeStr);
			article.setViewtimes(viewTimes);
		}
		if (upTimeStr != null) {
			upTimes = Integer.parseInt(upTimeStr);
			article.setUptimes(upTimes);
		}
		if (downTimeStr != null) {
			downTimes = Integer.parseInt(downTimeStr);
			article.setDowntimes(downTimes);
		}
		if (userIdStr != null) {
			if (userType.equals(Constants.TYPE_ACNE)) {
				Long userId = Long.parseLong(userIdStr);
				acneUserService.insertViewedArticle(articleId, userId);
			}
		}
		int result = articleService.postArticleHist(article);
		if (result == 1) {
			return MSG_SUCCESS;
		} else {
			return MSG_FAILED;
		}
	}

}
