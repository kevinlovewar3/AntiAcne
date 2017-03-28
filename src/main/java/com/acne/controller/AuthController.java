package com.acne.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.acne.model.AcneUser;
import com.acne.model.AntiAcneUser;
import com.acne.service.AuthService;

@Controller
@RequestMapping(value = "/")
public class AuthController {

	private static final Logger logger = LoggerFactory.getLogger(AuthController.class);

	@Autowired
	AuthService authService;

	private static final String MSG_SUCCESS = "{\"message\":\"success\"}";

	private static final String MSG_PHONE = "{\"message\":\"phone number is unavailable.\"}";
	private static final String MSG_PASSWORD = "{\"message\":\"password is unavailable.\"}";
	private static final String MSG_NOUSERTYPE = "{\"message\":\"user type is unavailable.\"}";
	private static final String MSG_NO_USER = "{\"message\":\"no user find.\"}";

	private static final String TYPE_ACNE = "acne_user";
	private static final String TYPE_ANTI = "anti_user";

	@RequestMapping(value = "login", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView postLogin(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mView = new ModelAndView("auth");

		String phone = request.getParameter("phone");
		String password = request.getParameter("password");
		String userType = request.getParameter("userType");

		if (StringUtils.isEmpty(phone) || phone.trim().length() != 11) {
			mView.addObject("result", MSG_PHONE);
			return mView;
		}
		if (StringUtils.isEmpty(password)) {
			mView.addObject("result", MSG_PASSWORD);
			return mView;
		}
		if (StringUtils.isEmpty(userType)) {
			mView.addObject("result", MSG_NOUSERTYPE);
			return mView;
		}
		password = DigestUtils.md5DigestAsHex(password.getBytes());
		if (userType.equalsIgnoreCase(TYPE_ACNE)) {
			AcneUser acneUser = authService.selectByPhone(phone, password);
			if (acneUser == null) {
				mView.addObject("result", MSG_NO_USER);
				return mView;
			}

			logger.info("login user: {}", acneUser);

			JSONObject acneUserJsonObj = new JSONObject(acneUser);
			mView.addObject("result", acneUserJsonObj);
			mView.addObject("userType", TYPE_ACNE);
		} else if (userType.equalsIgnoreCase(TYPE_ANTI)) {
			AntiAcneUser antiAcneUser = authService.selectAntiByPhone(phone, password);
			if (antiAcneUser == null) {
				mView.addObject("result", MSG_NO_USER);
				return mView;
			}

			logger.info("anti acne user: {}", antiAcneUser);

			JSONObject antiUserJsonObj = new JSONObject(antiAcneUser);
			mView.addObject("result", antiUserJsonObj);
			mView.addObject("userType", TYPE_ANTI);
		} else {
			mView.addObject("result", MSG_NOUSERTYPE);
			return mView;
		}

		return mView;
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView getLogin() {
		ModelAndView mView = new ModelAndView("auth");
		return mView;
	}

	@RequestMapping(value = "register", method = RequestMethod.POST, produces = { "application/json; charset=UTF-8" })
	@ResponseBody
	public String register(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET, produces = { "application/json; charset=UTF-8" })
	@ResponseBody
	public String logout(HttpServletRequest request, HttpServletResponse response) {

		String userType = request.getSession().getAttribute("userType").toString();
		String username = request.getSession().getAttribute("username").toString();
		String phone = request.getSession().getAttribute("phone").toString();
		request.getSession().removeAttribute(userType);
		request.getSession().removeAttribute(username);
		request.getSession().removeAttribute(phone);
		return MSG_SUCCESS;
	}

}
