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
	}
}
