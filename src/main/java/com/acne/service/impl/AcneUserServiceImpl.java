package com.acne.service.impl;

import javax.annotation.Resource;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;

import com.acne.service.AcneUserService;

@Service("acneUserService")
public class AcneUserServiceImpl implements AcneUserService {

	@Resource
	JmsTemplate jmsTemplate;

	@Autowired
	@Qualifier("queueDestination")
	private Destination destination;

	@Override
	public void insertViewedArticle(final Long articleId, final Long userId) {

		jmsTemplate.send(destination, new MessageCreator() {

			@Override
			public Message createMessage(Session session) throws JMSException {
				Message message = session.createMessage();
				message.setLongProperty("userId", userId);
				message.setLongProperty("articleId", articleId);
				return message;
			}
		});
	}

	@Override
	public void insertViewedGoods(Long goodsId, Long userId) {

	}

}
