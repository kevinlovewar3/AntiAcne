package com.acne.producer;

import javax.jms.Connection;
import javax.jms.DeliveryMode;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.connection.CachingConnectionFactory;

public class AcneCommentProducer {

	@Autowired
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
		
	}
}
