package com.acne.consumer;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.QueueConnection;
import javax.jms.Session;

import org.apache.activemq.command.ActiveMQQueue;
import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jms.connection.CachingConnectionFactory;

import com.acne.model.AcneComment;
import com.acne.websocket.SpringWebSocketHandler;

public class AcneCommentConsumer {

	Logger logger = LoggerFactory.getLogger(AcneCommentConsumer.class);

	@Autowired
	@Qualifier("springWebSocketHandler")
	SpringWebSocketHandler springWebSocketHandler;

	MessageConsumer consumer;

	public AcneCommentConsumer(CachingConnectionFactory connectionFactory, ActiveMQQueue commentDestination) {
		try {
			QueueConnection connection = connectionFactory.createQueueConnection();
			Session session = connection.createSession(false, Session.CLIENT_ACKNOWLEDGE);
			consumer = session.createConsumer(commentDestination);
		} catch (JMSException e) {
			e.printStackTrace();
		}
	}

	/*
	 * public void consume(Message message) throws JMSException {
	 * 
	 * AcneComment acneComment = new AcneComment();
	 * 
	 * Long userId = message.getLongProperty("userId"); if
	 * (springWebSocketHandler.isUserOnline(userId)) {
	 * acneComment.setUserId(userId);
	 * 
	 * List<String> comments = new ArrayList<>();
	 * comments.add(message.getStringProperty("comment"));
	 * acneComment.setComments(comments);
	 * 
	 * JSONArray array = new JSONArray(acneComment.getComments());
	 * springWebSocketHandler.sendMessageToUser(acneComment.getUserId(), new
	 * org.springframework.web.socket.TextMessage(array.toString()));
	 * 
	 * message.acknowledge(); } else {
	 * 
	 * }
	 * 
	 * }
	 */

	public void consume() throws JMSException {
		logger.info("start to consume message.");

		AcneComment acneComment = new AcneComment();
		Message message = consumer.receiveNoWait();
		while (message != null) {
			acneComment.setUserId(message.getLongProperty("userId"));
			String comment = message.getStringProperty("comment");
			acneComment.getComments().add(comment);

			try {
				message.acknowledge();
			} catch (JMSException e) {
				logger.info("message acknowledeg failed: {}", e.getLocalizedMessage());
			}

			message = consumer.receiveNoWait();
		}

		logger.info("send to user: userId {}, comment {}", acneComment.getUserId(), acneComment.getComments());
		if (acneComment.getUserId() == null) {
			return;
		}
		JSONArray array = new JSONArray(acneComment.getComments());
		springWebSocketHandler.sendMessageToUser(acneComment.getUserId(),
				new org.springframework.web.socket.TextMessage(array.toString()));
	}
}
