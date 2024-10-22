package model.entity;

import java.io.Serializable;

public class LoginBean implements Serializable {
	private String loginId;
	private String authorityName;
	
	public LoginBean() {
		//処理なし
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getAuthorityName() {
		return authorityName;
	}

	public void setAuthorityName(String authorityName) {
		this.authorityName = authorityName;
	}
}
