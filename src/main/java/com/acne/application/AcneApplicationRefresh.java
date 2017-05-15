package com.acne.application;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

import com.acne.service.AcneUserService;
import com.acne.service.AntiUserService;

public class AcneApplicationRefresh implements ApplicationListener<ContextRefreshedEvent> {

	private static final Logger logger = LoggerFactory.getLogger(AcneApplicationRefresh.class);

	@Autowired
	AcneUserService acneUserService;

	@Autowired
	AntiUserService antiUserService;

	@Autowired
	AcneApplicationCtx applicationCtx;

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		Integer acneNum = acneUserService.queryAcneUserNum();
		Integer antiNum = antiUserService.queryAntiUserNum();
		applicationCtx.setAcneNum(acneNum);
		applicationCtx.setAntiNum(antiNum);

		logger.info("Acne user number is: {}, anti user number is: {}", acneNum, antiNum);
	}

}
