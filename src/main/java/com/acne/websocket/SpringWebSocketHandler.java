package com.acne.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.acne.consumer.AcneCommentConsumer;
import com.acne.util.ObjectUtil;

public class SpringWebSocketHandler extends TextWebSocketHandler {

	Logger logger = LoggerFactory.getLogger(SpringWebSocketHandler.class);
	private static final ArrayList<WebSocketSession> users;// 这个会出现性能问题，最好用Map来存储，key用userid
	private static final ConcurrentHashMap<Long, WebSocketSession> webSockUsers;
	static {
		users = new ArrayList<WebSocketSession>();
		webSockUsers = new ConcurrentHashMap<>();
	}

	@Autowired
	AcneCommentConsumer acneCommentConsumer;

	public SpringWebSocketHandler() {
	}

	/**
	 * 连接成功时候，会触发页面上onopen方法
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.add(session);

		logger.info("connect successfully, current number is: {}", users.size());
		// 这块会实现自己业务，比如，当用户登录后，会把离线消息推送给用户
		// TextMessage returnMessage = new TextMessage("你将收到的离线");
		// session.sendMessage(returnMessage);
		
		acneCommentConsumer.consume();
	}

	/**
	 * 关闭连接时触发
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		logger.debug("websocket connection closed......");
		Long userId = ObjectUtil.ObjectToLong(session.getAttributes().get("userId"));
		String username = (String) session.getAttributes().get("username");
		logger.info("user id: {}, username: {} exit!", userId, username);
		users.remove(session);
		logger.info("user left number is: {}", users.size());
	}

	/**
	 * js调用websocket.send时候，会调用该方法
	 */
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		logger.info(message.getPayload());

		super.handleTextMessage(session, message);
	}

	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		if (session.isOpen()) {
			session.close();
		}
		logger.debug("websocket connection closed......");
		users.remove(session);
		logger.info("user left number is: {}", users.size());
	}

	public boolean supportsPartialMessages() {
		return false;
	}

	/**
	 * 给某个用户发送消息
	 *
	 * @param userName
	 * @param message
	 */
	public boolean sendMessageToUser(Long userId, TextMessage message) {

		logger.info("users list: {}", users);
		for (WebSocketSession user : users) {
			if (user.getAttributes().get("userId").equals(userId)) {
				try {
					if (user.isOpen()) {
						user.sendMessage(message);
					}
				} catch (IOException e) {
					e.printStackTrace();
					return false;
				}
				return true;
			}
		}
		return false;
	}

	/**
	 * 给所有在线用户发送消息
	 *
	 * @param message
	 */
	public void sendMessageToUsers(TextMessage message) {
		System.out.println("send message to all users.");
		for (WebSocketSession user : users) {
			try {
				if (user.isOpen()) {
					user.sendMessage(message);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
