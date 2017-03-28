package com.acne.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acne.model.Suggest;
import com.acne.service.ManageService;

@Controller
@RequestMapping(value = "/")
public class ManageController {

	private static final Logger logger = LoggerFactory.getLogger(ManageController.class);

	private static final String MSG_SUCCESS = "{\"result\":\"receive your message successfully.\"}";

	@Autowired
	ManageService manageService;

	@RequestMapping(value = "post_suggest", method = RequestMethod.POST, produces = {
			"application/json; charset=UTF-8" })
	@ResponseBody
	public String postSuggest(HttpServletRequest request, HttpServletResponse response) {

		String userId = request.getParameter("userId");
		String userType = request.getParameter("userType");
		String suggestText = request.getParameter("suggest");

		logger.info("userId: {}, userType: {}, suggestText: {}", userId, userType, suggestText);

		Suggest suggest = new Suggest();
		if (userId != null && userId.length() != 0) {
			suggest.setUserid(Long.parseLong(userId));
		}
		if (userType != null && userType.length() != 0) {
			suggest.setUsertype(userType);
		}
		suggest.setSuggesttext(suggestText);
		suggest.setAvailable(1);
		suggest.setSuggesttime(new Date());

		manageService.insertSuggest(suggest);

		return MSG_SUCCESS;
	}

}
