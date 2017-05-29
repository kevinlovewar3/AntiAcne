package com.acne.controller;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.jms.JMSException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.acne.constant.Constants;
import com.acne.model.AcneImage;
import com.acne.model.AcneUser;
import com.acne.service.AcneImageService;
import com.acne.service.AcneUserService;
import com.acne.util.ImageCut;
import com.acne.util.ObjectUtil;
import com.acne.util.StringUtil;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping(value = "/")
public class AcneUserController {

	private static final Logger logger = LoggerFactory.getLogger(AcneUserController.class);
	private static final String MSG_SUCCESS = "{\"message\":\"success\"}";
	private static final String MSG_FAILED = "{\"message\":\"failed\"}";
	private static final String MSG_NO_IMAGE = "{\"message\":\"no image specified!\"}";

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
	 * @throws JMSException
	 */
	@RequestMapping(value = "acneuser", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView acneUser(HttpServletRequest request, HttpServletResponse response) throws JMSException {
		ModelAndView mView = new ModelAndView("acneuser");
		return mView;
	}

	/**
	 * 上传用户头像
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "image/avatar", method = RequestMethod.POST)
	@ResponseBody
	public String postAvatar(@RequestParam("file") MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		Integer x1 = Integer.parseInt(request.getParameter("x1"));
		Integer y1 = Integer.parseInt(request.getParameter("y1"));
		Integer x2 = Integer.parseInt(request.getParameter("x2"));
		Integer y2 = Integer.parseInt(request.getParameter("y2"));

		Object userIdObj = request.getSession().getAttribute("userId");
		Long userId = ObjectUtil.ObjectToLong(userIdObj);

		if (file != null) {
			int position = file.getOriginalFilename().lastIndexOf(".");
			String append = file.getOriginalFilename().substring(position + 1, file.getOriginalFilename().length());
			String fileName = System.currentTimeMillis() + "." + append;

			String path = Constants.AVATAR_PATH + File.separator + fileName;
			File tempFile = new File(path);
			tempFile.getParentFile().mkdirs();
			while (tempFile.exists()) {
				fileName = System.currentTimeMillis() + "." + append;
				path = Constants.AVATAR_PATH + File.separator + fileName;
				tempFile = new File(path);
			}
			boolean result = tempFile.createNewFile();
			if (result == false) {
				return MSG_FAILED;
			}
			File inputImgFile = new File(tempFile.getParent(), "temp_" + tempFile.getName());
			FileUtils.copyInputStreamToFile(file.getInputStream(), inputImgFile);
			ImageCut.cutImage(append, inputImgFile, tempFile.getAbsolutePath(), x1, y1, x2, y2);
			inputImgFile.delete();
			acneImageService.postAvatar(fileName, userId);
			String success = "{\"message\":\"success\", \"filename\": \"" + fileName + "\"}";
			return success;
		} else {
			return MSG_FAILED;
		}
	}

	/**
	 * 根据用户ID获取用户头像
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "image/avatar/acneuser", method = RequestMethod.GET)
	@ResponseBody
	public String getAvatarByUserId(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Object userIdObj = request.getSession().getAttribute("userId");
		Long userId = ObjectUtil.ObjectToLong(userIdObj);
		String fileName = acneUserService.queryAvatarByUserId(userId);

		File file = new File(Constants.AVATAR_PATH + File.separator + fileName);
		InputStream inputStream = new ByteArrayInputStream(FileUtils.readFileToByteArray(file));
		response.setContentType("image/jpeg");
		String attachement = "inline;filename=" + fileName;
		response.setHeader("content-Disposition", attachement);
		response.setContentLength(inputStream.available());
		IOUtils.copy(inputStream, response.getOutputStream());
		response.flushBuffer();
		inputStream.close();
		return MSG_SUCCESS;
	}

	/**
	 * 获取用户头像
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "image/avatar/{avatarId}", method = RequestMethod.GET)
	@ResponseBody
	public void getAvatar(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String uri = request.getRequestURI();
		int index = uri.lastIndexOf("/");
		if (index == -1) {
			return;
		}

		String fileName = uri.substring(index + 1, uri.length());
		File file = new File(Constants.AVATAR_PATH + File.separator + fileName);
		InputStream inputStream = new ByteArrayInputStream(FileUtils.readFileToByteArray(file));
		response.setContentType("image/jpeg");
		String attachment = "inline;filename=" + fileName;
		response.setHeader("content-Disposition", attachment);
		response.setContentLength(inputStream.available());
		IOUtils.copy(inputStream, response.getOutputStream());
		response.flushBuffer();
		inputStream.close();
	}

	/**
	 * 获取照片
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "image/{imageId}", method = RequestMethod.GET)
	@ResponseBody
	public void getImage(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String uri = request.getRequestURI();
		int index = uri.lastIndexOf("/");
		if (index == -1) {
			return;
		}
		String fileName = uri.substring(index + 1, uri.length());

		File file = new File(Constants.IMAGE_PATH + File.separator + fileName);
		InputStream inputStream = new ByteArrayInputStream(FileUtils.readFileToByteArray(file));
		response.setContentType("image/jpeg");
		String attachment = "inline;filename=" + fileName;
		response.setHeader("content-Disposition", attachment);
		response.setContentLength(inputStream.available());
		IOUtils.copy(inputStream, response.getOutputStream());
		response.flushBuffer();
		inputStream.close();
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
		Long userId = ObjectUtil.ObjectToLong(userIdObj);
		List<AcneImage> acneImages = acneImageService.getImages(userId);
		mView.addObject("acneImages", acneImages);

		logger.info("acne images {}", acneImages);

		return mView;
	}

	/**
	 * 修改图片权限，删除图片
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "update/image/{imageId}", method = RequestMethod.POST)
	@ResponseBody
	public String updateDeleteImage(HttpServletRequest request, HttpServletResponse response) {
		String uri = request.getRequestURI();
		int index = uri.lastIndexOf("/");
		if (index == -1) {
			return MSG_NO_IMAGE;
		}
		String imageId = uri.substring(index + 1, uri.length());
		Long imageid = StringUtil.StringToLong(imageId);
		String operation = request.getParameter("operation");
		switch (operation) {
		case "update": {
			String authority = request.getParameter("authority");
			AcneImage image = new AcneImage();
			image.setImageid(imageid);
			if (authority.equals("open")) {
				image.setAuthorith(0);
			} else {
				image.setAuthorith(1);
			}
			acneImageService.updateAcneImage(image);
			return MSG_SUCCESS;
		}
		case "delete":
			acneImageService.deleteAcneImage(imageid);
			return MSG_SUCCESS;

		default:
			break;
		}

		return MSG_SUCCESS;
	}

	/**
	 * 上传自拍图片接口
	 * 
	 * @param request
	 * @param response
	 * @throws IllegalStateException
	 * @throws IOException
	 */
	@RequestMapping(value = "post_images", method = RequestMethod.POST)
	@ResponseBody
	public String postImage(@RequestParam("file") MultipartFile file, HttpServletRequest request)
			throws IllegalStateException, IOException {

		Object userIdObj = request.getSession().getAttribute("userId");
		Long userId = ObjectUtil.ObjectToLong(userIdObj);

		String description = request.getParameter("description");
		if (description == null) {
			description = "";
		}

		if (file != null) {
			int position = file.getOriginalFilename().lastIndexOf(".");
			String append = file.getOriginalFilename().substring(position, file.getOriginalFilename().length());
			String fileName = System.currentTimeMillis() + append;

			String path = Constants.IMAGE_PATH + File.separator + fileName;
			File tempFile = new File(path);
			tempFile.getParentFile().mkdirs();
			while (tempFile.exists()) {
				fileName = System.currentTimeMillis() + append;
				path = Constants.IMAGE_PATH + File.separator + fileName;
				tempFile = new File(path);
			}
			boolean result = tempFile.createNewFile();
			if (result == false) {
				return MSG_FAILED;
			}
			file.transferTo(new File(path));

			acneImageService.postImages(fileName, userId, description);
			return MSG_SUCCESS;
		}
		return MSG_FAILED;
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

		PageInfo<AcneImage> acneUsers = acneImageService.queryByPage(pageNo, pageSize);
		List<AcneImage> list = acneUsers.getList();
		int pages = acneUsers.getPages();

		logger.info("Total num: {}, current {}, PageInfo<AcneUser>: {}", pages, pageNo, acneUsers);
		mView.addObject("acneUsers", list);
		mView.addObject("pages", pages);
		mView.addObject("current", pageNo);
		return mView;
	}

	/**
	 * 痘痘患者获取个人信息
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "post_self", method = RequestMethod.GET, produces = { "application/json; charset=UTF-8" })
	@ResponseBody
	public String postSelf(HttpServletRequest request, HttpServletResponse response) {
		Object userIdObj = request.getSession().getAttribute("userId");
		Long userId = ObjectUtil.ObjectToLong(userIdObj);

		AcneUser acneUser = acneUserService.queryAcneUserByUserId(userId);

		logger.info("AcneUser Detail info is: {}", acneUser);
		JSONObject acneUserJsonObj = new JSONObject(acneUser);
		return acneUserJsonObj.toString();
	}
	
	/**
	 * 显示评论页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "check_comments/{imageId}", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getComments(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mView = new ModelAndView("acne_comment");
		Object imageIdObj = request.getParameter("imageId");
		Long imageId = ObjectUtil.ObjectToLong(imageIdObj);
		
		
		return mView;
	}

}
