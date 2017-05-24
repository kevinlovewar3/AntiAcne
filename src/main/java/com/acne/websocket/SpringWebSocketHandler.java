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
	private static final ArrayList<WebSocketSession> users;// ���������������⣬�����Map���洢��key��userid
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
	 * ���ӳɹ�ʱ�򣬻ᴥ��ҳ����onopen����
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.add(session);

		logger.info("connect successfully, current number is: {}", users.size());
		// ����ʵ���Լ�ҵ�񣬱��磬���û���¼�󣬻��������Ϣ���͸��û�
		// TextMessage returnMessage = new TextMessage("�㽫�յ�������");
		// session.sendMessage(returnMessage);
		
		acneCommentConsumer.consume();
	}

	/**
	 * �ر�����ʱ����
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
	 * js����websocket.sendʱ�򣬻���ø÷���
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
	 * ��ĳ���û�������Ϣ
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
	 * �����������û�������Ϣ
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
