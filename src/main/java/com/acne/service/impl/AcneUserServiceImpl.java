package com.acne.service.impl;

import java.util.List;

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

import com.acne.dao.AcneUserMapper;
import com.acne.model.AcneUser;
import com.acne.service.AcneUserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service("acneUserService")
public class AcneUserServiceImpl implements AcneUserService {

	@Autowired
	AcneUserMapper acneUserMapper;

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

	@Override
	public PageInfo<AcneUser> queryByPage(Integer pageNo, Integer pageSize) {
		pageNo = pageNo == null ? 1 : pageNo;
		pageSize = pageSize == null ? 9 : pageSize;

		PageHelper.startPage(pageNo, pageSize);
		List<AcneUser> list = acneUserMapper.selectAll();
		PageInfo<AcneUser> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}

	@Override
	public String queryAvatarByUserId(Long userId) {
		return acneUserMapper.queryAvatarByUserId(userId);
	}

	@Override
	public Integer queryAcneUserNum() {
		return acneUserMapper.queryAcneUserNum();
	}

	@Override
	public AcneUser queryAcneUserByUserId(Long userId) {
		return acneUserMapper.selectByPrimaryKey(userId);
	}

}
