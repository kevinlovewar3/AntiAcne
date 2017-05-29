package com.acne.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class AcneComment implements Serializable {

	private static final long serialVersionUID = 7828738787364736L;

	private Long userId;
	private List<String> comments;

	public AcneComment() {
		comments = new ArrayList<>();
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setComments(List<String> comments) {
		this.comments = comments;
	}

	public List<String> getComments() {
		return comments;
	}
}
