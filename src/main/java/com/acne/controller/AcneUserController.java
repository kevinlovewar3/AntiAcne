package com.acne.controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.acne.model.AcneImage;
import com.acne.model.AcneUser;
import com.acne.service.AcneImageService;
import com.acne.service.AcneUserService;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value = "/")
public class AcneUserController {

	private static final Logger logger = LoggerFactory.getLogger(AcneUserController.class);

	@Autowired
	AcneUserService acneUserService;

	@Autowired
	AcneImageService acneImageService;

	/**
	 * 痘痘患者首页
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "acneuser", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView acneUser(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mView = new ModelAndView("acneuser");
		return mView;
	}

	/**
	 * 痘痘患者上传照片界面
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "post_images", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView postImages(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mView = new ModelAndView("acneuser_images");
		Object userIdObj = request.getSession().getAttribute("userId");
		Long userId = Long.parseLong(userIdObj.toString());
		List<AcneImage> acneImages = acneImageService.getImages(userId);
		mView.addObject("acneImages", acneImages);
		return mView;
	}

	@RequestMapping(value = "post_images", method = RequestMethod.POST)
	@ResponseBody
	public void postImage(HttpServletRequest request, HttpServletResponse response)
			throws IllegalStateException, IOException {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
				request.getSession().getServletContext());
		if (multipartResolver.isMultipart(request)) {
			MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
			Iterator iterator = multipartHttpServletRequest.getFileNames();
			while (iterator.hasNext()) {
				MultipartFile file = multipartHttpServletRequest.getFile(iterator.next().toString());
				if (file != null) {
					String path = "E:/springUpload" + file.getOriginalFilename();
					file.transferTo(new File(path));
				}
			}
		}
		String script = "<script>alert('hello!');</script>";
		response.getOutputStream().write(script.getBytes("utf-8"));
	}

	/**
	 * 治痘达人查看痘痘患者
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "view_acne", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView viewAcne(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mView = new ModelAndView("view_acne");
		String pageNoStr = request.getParameter("pageNo");
		String pageSizeStr = request.getParameter("pageSize");

		Integer pageNo = StringUtils.isEmpty(pageNoStr) ? 1 : Integer.parseInt(pageNoStr);
		Integer pageSize = StringUtils.isEmpty(pageSizeStr) ? 9 : Integer.parseInt(pageSizeStr);

		PageInfo<AcneUser> acneUsers = acneUserService.queryByPage(pageNo, pageSize);
		List<AcneUser> list = acneUsers.getList();
		int pages = acneUsers.getPages();

		logger.info("Total num: {}, current {}, PageInfo<AcneUser>: {}", pages, pageNo, acneUsers);
		mView.addObject("acneUsers", list);
		mView.addObject("pages", pages);
		return mView;
	}

	/**
	 * 痘痘患者完善个人信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "post_self", method = RequestMethod.GET, produces = { "application/json; charset=UTF-8" })
	@ResponseBody
	public String postSelf(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

}
