package com.acne.websocket;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.acne.util.ObjectUtil;

public class SpringWebSocketHandlerInterceptor extends HttpSessionHandshakeInterceptor {

	Logger logger = LoggerFactory.getLogger(SpringWebSocketHandlerInterceptor.class);

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		super.afterHandshake(request, response, wsHandler, ex);
	}

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {

		logger.info("before handshake");

		if (request instanceof ServletServerHttpRequest) {
			ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
			HttpSession session = servletRequest.getServletRequest().getSession(false);

			logger.info("request instanceof servletserverhttprequest");

			if (session != null) {
				Long userId = ObjectUtil.ObjectToLong(session.getAttribute("userId"));

				if (userId == null) {
					userId = 0L;
					attributes.put("userId", userId);
				}
			}
		}
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}

}
