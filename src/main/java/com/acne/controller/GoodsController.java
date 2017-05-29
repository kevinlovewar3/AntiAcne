package com.acne.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.acne.model.GoodsWithBLOBs;
import com.acne.service.GoodsService;
import com.acne.util.ObjectUtil;
import com.acne.util.StringUtil;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value = "/")
public class GoodsController {

	private static final Logger logger = LoggerFactory.getLogger(GoodsController.class);

	@Autowired
	GoodsService goodsService;

	@RequestMapping(value = "goods-self", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getSelfGoods(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mView = new ModelAndView("goods_temp");

		return mView;
	}

	/**
	 * 获取产品列表
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "goods", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getGoods(HttpServletRequest request, HttpServletResponse response) {

		String pageNoStr = request.getParameter("pageNo");
		String pageSizeStr = request.getParameter("pageSize");
		Integer pageNo = StringUtils.isEmpty(pageNoStr) ? 1 : Integer.parseInt(pageNoStr);
		Integer pageSize = StringUtils.isEmpty(pageSizeStr) ? 9 : Integer.parseInt(pageSizeStr);
		PageInfo<GoodsWithBLOBs> goodsWithBlobs = goodsService.queryByPage(pageNo, pageSize);
		List<GoodsWithBLOBs> list = goodsWithBlobs.getList();
		int pages = goodsWithBlobs.getPages();

		ModelAndView mView = new ModelAndView("goods");
		mView.addObject("goods", list);
		mView.addObject("pages", pages);
		mView.addObject("current", pageNo);
		return mView;
	}

	/**
	 * 获取祛痘达人发布的产品
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "posted_goods", method = RequestMethod.GET, produces = {
			"application/json; charset=UTF-8" })
	@ResponseBody
	public String postedGoods(HttpServletRequest request, HttpServletResponse response) {

		Long userId = StringUtil.StringToLong(request.getParameter("antiUserId"));
		if (userId == Long.MIN_VALUE) {
			userId = ObjectUtil.ObjectToLong(request.getSession().getAttribute("userId"));
		}

		List<GoodsWithBLOBs> goodsWithBLOBs = goodsService.queryPostedGoods(userId);
		logger.info("/acne/posted_goods, GoodsWithBLOBs: {}", goodsWithBLOBs);
		JSONArray array = new JSONArray(goodsWithBLOBs);
		return array.toString();
	}

	/**
	 * 用户上传产品
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "add_goods", method = RequestMethod.POST)
	@ResponseBody
	public String postGoods(HttpServletRequest request, HttpServletResponse response) {

		Object userIdObj = request.getSession().getAttribute("userId");
		Long userId = ObjectUtil.ObjectToLong(userIdObj);
		GoodsWithBLOBs goodsWithBLOBs = new GoodsWithBLOBs();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Date date = new Date();
		goodsWithBLOBs.setAvailable(1);
		goodsWithBLOBs.setBrowsenum(0);
		goodsWithBLOBs.setDescription(content);
		goodsWithBLOBs.setGoodsname(title);
		goodsWithBLOBs.setScore(0);
		goodsWithBLOBs.setUploaddate(date);

		goodsService.addGoods(userId, goodsWithBLOBs);

		return "{\"message\":\"success\"}";
	}

	/**
	 * 获取产品浏览记录
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "goods_hist", method = RequestMethod.GET)
	@ResponseBody
	public String getGoodsHist(HttpServletRequest request, HttpServletResponse response) {
		String userIdStr = request.getParameter("userId");
		Integer size = null;
		Long userId = null;
		if (userIdStr != null) {
			userId = Long.parseLong(userIdStr);
		}
		size = 5;
		List<GoodsWithBLOBs> goodsWithBLOBs = goodsService.queryViewedGoods(userId, size);

		logger.info("Get goods hist: {}", goodsWithBLOBs);

		JSONArray array = new JSONArray(goodsWithBLOBs);
		return array.toString();
	}

	/**
	 * 产品详情页面
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "goods_home/{goodsId}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getGoodsHome(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mView = new ModelAndView("goods_home");

		String uri = request.getRequestURI();
		int index = uri.lastIndexOf("/");
		String goodsIdStr = uri.substring(index + 1, uri.length());
		Long goodsId = StringUtil.StringToLong(goodsIdStr);
		
		logger.info("Request info: {}", goodsId);
		
		GoodsWithBLOBs goodsWithBLOBs = goodsService.queryGoodsByGoodsId(goodsId);
		mView.addObject("goods", goodsWithBLOBs);
		
		logger.info("Response info: {}", goodsWithBLOBs);

		return mView;
	}

	/**
	 * 上传图片页面
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "post_goods", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getGoodsReadOnly(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mView = new ModelAndView("post_goods");
		return mView;
	}

}
