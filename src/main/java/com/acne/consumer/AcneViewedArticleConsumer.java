package com.acne.consumer;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.acne.dao.AcneUserMapper;

public class AcneViewedArticleConsumer implements MessageListener {

	private Logger logger = LoggerFactory.getLogger(AcneViewedArticleConsumer.class);

	@Autowired
	AcneUserMapper acneUserMapper;

	@Override
	public void onMessage(Message message) {
		try {
			Long articleId = message.getLongProperty("articleId");
			Long userId = message.getLongProperty("userId");
			acneUserMapper.insertViewedArticle(articleId, userId);
		} catch (JMSException e) {
			logger.error("error to insert acne user viewed article id into table {}", e);
			e.printStackTrace();
		}
	}

}
