package com.acne.producer;

import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

public class AcneCommentProducer {

	private static final Logger logger = LoggerFactory.getLogger(AcneCommentProducer.class);

	@Autowired
	Destination commentDestination;

	@Autowired
<<<<<<< HEAD
	CachingConnectionFactory connectionFactory;

	
	
	MessageProducer producer;
	Connection connection;
	Session session;
	Destination destination;

	public void send(String queue, String message) throws JMSException {
		connection = connectionFactory.createQueueConnection();
		connection.start();
		session = connection.createSession(Boolean.TRUE, Session.AUTO_ACKNOWLEDGE);
		destination = session.createQueue(queue);
		producer = session.createProducer(destination);
		producer.setDeliveryMode(DeliveryMode.PERSISTENT);
		
		TextMessage msg = session.createTextMessage(message);
		producer.send(msg);
		connection.close();
		
=======
	JmsTemplate jmsTemplate;

	public void send(final Long userId, final String coment) throws JMSException {

		jmsTemplate.send(commentDestination, new MessageCreator() {

			@Override
			public Message createMessage(Session session) {
				try {

					Message message = session.createMessage();
					message.setLongProperty("userId", userId);
					message.setStringProperty("comment", coment);

					logger.info("message created. {}", message);
					return message;
				} catch (JMSException e) {
					logger.info("create message error: {}", e.getLocalizedMessage());
				}
				return null;
			}
		});
>>>>>>> dad2190a80deff6addf1992c9f18b5293722351c
	}
}
