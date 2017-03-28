package com.acne.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acne.dao.SuggestMapper;
import com.acne.model.Suggest;
import com.acne.service.ManageService;

@Service("manageService")
public class ManageServiceImpl implements ManageService {

	@Autowired
	SuggestMapper suggestMapper;

	public void insertSuggest(Suggest suggest) {
		suggestMapper.insertSelective(suggest);
	}

}
