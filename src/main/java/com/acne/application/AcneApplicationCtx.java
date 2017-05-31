package com.acne.application;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class AcneApplicationCtx implements ApplicationContextAware {

	private ApplicationContext applicationContext;

	private Object acneNumLock = new Object();
	private Object antiNumLock = new Object();
	private Object onlineLock = new Object();
	private Integer acneNum = 0;
	private Integer antiNum = 0;
	private Integer onlineNum = 0;

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
	}

	public void setAcneNum(Integer num) {
		acneNum = num;
	}

	public void setAntiNum(Integer num) {
		antiNum = num;
	}

	public void setOnlineNum(Integer num) {
		onlineNum = num;
	}

	public void increaseAcneNum() {
		synchronized (acneNumLock) {
			acneNum++;
		}
	}

	public void increaseOnlineNum() {
		synchronized (onlineLock) {
			onlineNum++;
		}
	}

	public void decreaseOnlineNum() {
		synchronized (onlineLock) {
			onlineNum--;
		}
	}

	public Integer getOnlineNum() {
		return onlineNum;
	}

	public Integer getAcneNum() {
		return acneNum;
	}

	public void increaseAntiNum() {
		synchronized (antiNumLock) {
			antiNum++;
		}
	}

	public Integer getAntiNum() {
		return antiNum;
	}
}
