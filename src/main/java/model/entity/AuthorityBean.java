package model.entity;

import java.io.Serializable;

public class AuthorityBean implements Serializable {
	private String authorityCode;
	private String authorityName;
	
	public AuthorityBean() {
		//処理なし
	}

	public String getAuthorityCode() {
		return authorityCode;
	}

	public void setAuthorityCode(String authorityCode) {
		this.authorityCode = authorityCode;
	}

	public String getAuthorityName() {
		return authorityName;
	}

	public void setAuthorityName(String authorityName) {
		this.authorityName = authorityName;
	}
	
}
