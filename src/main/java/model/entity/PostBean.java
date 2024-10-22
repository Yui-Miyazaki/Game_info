package model.entity;

import java.io.Serializable;

public class PostBean implements Serializable {
	private String postCode;
	private String postName;
	
	public PostBean() {
	}

	public String getPostCode() {
		return postCode;
	}

	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}

	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}
	
}
