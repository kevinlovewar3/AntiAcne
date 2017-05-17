package com.acne.consumer;

import javax.jms.Connection;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageConsumer;
import javax.jms.MessageListener;
import javax.jms.MessageProducer;
import javax.jms.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.connection.CachingConnectionFactory;

public class AcneCommentConsumer implements MessageListener {

	Logger logger = LoggerFactory.getLogger(AcneCommentConsumer.class);
	
	@Autowired
	CachingConnectionFactory connectionFactory;

	MessageProducer producer;
	MessageConsumer consumer;
	Connection connection;
	Session session;
	Destination destination;
	
	String queue;
	
	public void setQueue(String queue) {
		this.queue = queue;
	}
	
	public String getQueue() {
		return queue;
	}

	public AcneCommentConsumer(){
		
	}
	
	public void createQueue() throws JMSException{
		connection = connectionFactory.createQueueConnection();
		connection.start();
		session = connection.createSession(Boolean.TRUE, Session.AUTO_ACKNOWLEDGE);
		destination = session.createQueue(queue);
		consumer = session.createConsumer(destination);
		consumer.setMessageListener(this);
	}

	@Override
	public void onMessage(Message message) {

		logger.info("message consumed.");
		
		try {
			message.acknowledge();
		} catch (JMSException e) {
			e.printStackTrace();
		}
	}

}
