package com.acne.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/")
public class AcneUserController {

	@RequestMapping(value = "acneuser", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView acneUser(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mView = new ModelAndView("acneuser");
		return mView;
	}

	@RequestMapping(value = "post_images", method = RequestMethod.GET, produces = { "application/json; charset=UTF-8" })
	@ResponseBody
	public String postImages(HttpServletRequest request, HttpServletResponse response) {

		return null;
	}
}
