package com.acne.websocket;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class SpringWebSocketConfig extends WebMvcConfigurerAdapter implements WebSocketConfigurer {

	Logger logger = LoggerFactory.getLogger(SpringWebSocketConfig.class);

	@Autowired
	@Qualifier("springWebSocketHandler")
	SpringWebSocketHandler springWebSocketHandler;

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(springWebSocketHandler, "/websocket/socketserver")
				.addInterceptors(new SpringWebSocketHandlerInterceptor());
		registry.addHandler(springWebSocketHandler, "/sockjs/websocket/socketserver")
				.addInterceptors(new SpringWebSocketHandlerInterceptor()).withSockJS();
	}

}
