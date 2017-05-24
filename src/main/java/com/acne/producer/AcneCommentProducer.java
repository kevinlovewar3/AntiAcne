package com.acne.producer;

import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

public class AcneCommentProducer {

	@Autowired
	@Qualifier("commentDestination")
	private Destination destination;

	@Autowired
	JmsTemplate jmsTemplate;

	public void send(final Long userId, final String coment) throws JMSException {

		jmsTemplate.send(destination, new MessageCreator() {

			@Override
			public Message createMessage(Session session) throws JMSException {
				Message message = session.createMessage();
				message.setLongProperty("userId", userId);
				message.setStringProperty("comment", coment);
				return message;
			}
		});
	}
}
