package com.acne.websocket;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

import javax.jms.JMSException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.acne.consumer.AcneCommentConsumer;
import com.acne.util.ObjectUtil;

public class SpringWebSocketHandler extends TextWebSocketHandler {

	Logger logger = LoggerFactory.getLogger(SpringWebSocketHandler.class);
	// private static final ArrayList<WebSocketSession> users;//
	// ���������������⣬�����Map���洢��key��userid
	private static final ConcurrentHashMap<Long, WebSocketSession> webSockUsers;
	static {
		// users = new ArrayList<WebSocketSession>();
		webSockUsers = new ConcurrentHashMap<>();
	}

	@Autowired
	@Qualifier("acneCommentConsumer")
	AcneCommentConsumer acneCommentConsumer;

	public SpringWebSocketHandler() {
	}

	/**
	 * ���ӳɹ�ʱ�򣬻ᴥ��ҳ����onopen����
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) {
		Object userIdObj = session.getAttributes().get("userId");
		Long userId = ObjectUtil.ObjectToLong(userIdObj);
		webSockUsers.put(userId, session);

		logger.info("connect successfully, current number is: {}", webSockUsers.size());
		// ����ʵ���Լ�ҵ�񣬱��磬���û���¼�󣬻��������Ϣ���͸��û�
		// TextMessage returnMessage = new TextMessage("�㽫�յ�������");
		// session.sendMessage(returnMessage);

		try {
			acneCommentConsumer.consume();
			
		} catch (JMSException e) {
			logger.info("JMSException: {}", e.getLocalizedMessage());
		}
	}

	/**
	 * �ر�����ʱ����
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus closeStatus) throws Exception {
		logger.info("websocket connection closed... {}", closeStatus);
		Object userIdObj = session.getAttributes().get("userId");
		String username = (String) session.getAttributes().get("username");
		logger.info("user id: {}, username: {} exit!", userIdObj, username);

		webSockUsers.remove(userIdObj);
		logger.info("user left number is: {}", webSockUsers.size());
	}

	public boolean isUserOnline(Long userId) {
		WebSocketSession session = webSockUsers.get(userId);
		if (session == null) {
			return false;
		} else {
			Object userIdObj = session.getAttributes().get("userId");
			if (userIdObj != null) {
				return true;
			}
			return false;
		}
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
		Object userIdObj = session.getAttributes().get("userId");
		webSockUsers.remove(userIdObj);
		logger.info("user left number is: {}", webSockUsers.size());
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

		WebSocketSession session = webSockUsers.get(userId);
		if (session == null) {
			logger.info("session is null.");
		} else {
			try {
				if (session.isOpen()) {
					session.sendMessage(message);
				}
			} catch (IOException e) {
				e.printStackTrace();
				return false;
			}
			return true;
		}
		return false;

	}

	/**
	 * �����������û�������Ϣ
	 *
	 * @param message
	 */
	public void sendMessageToUsers(TextMessage message) {

		for (Long id : webSockUsers.keySet()) {
			try {
				WebSocketSession session = webSockUsers.get(id);
				if (session.isOpen()) {
					session.sendMessage(message);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
