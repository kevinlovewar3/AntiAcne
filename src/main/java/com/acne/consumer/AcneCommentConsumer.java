package com.acne.consumer;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.QueueConnection;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.activemq.command.ActiveMQQueue;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.connection.CachingConnectionFactory;

import com.acne.websocket.SpringWebSocketHandler;

public class AcneCommentConsumer {

	Logger logger = LoggerFactory.getLogger(AcneCommentConsumer.class);

	@Autowired
	SpringWebSocketHandler springWebSocketHandler;

	@Autowired
	CachingConnectionFactory connectionFactory;

	@Autowired
	ActiveMQQueue commentDestination;

	public void consume() throws JMSException {
		QueueConnection connection = connectionFactory.createQueueConnection();
		Session session = connection.createSession(false, Session.CLIENT_ACKNOWLEDGE);
		MessageConsumer consumer = session.createConsumer(commentDestination);
		Message message = consumer.receive();
		if (message instanceof TextMessage) {
			Long userId = ((TextMessage) message).getLongProperty("userId");
			String comment = ((TextMessage) message).getStringProperty("comment");

			boolean isSent = springWebSocketHandler.sendMessageToUser(userId,
					new org.springframework.web.socket.TextMessage(comment));
			if (isSent) {
				try {
					message.acknowledge();
				} catch (JMSException e) {
				}
			}
		}
	}

}
