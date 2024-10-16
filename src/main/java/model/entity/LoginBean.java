package model.entity;

import java.io.Serializable;

public class LoginBean implements Serializable {
	private String user_id;
	private String password;
	private String salt;
	private String hash_salt;
	
	public LoginBean() {
		
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public String getHash_salt() {
		return hash_salt;
	}

	public void setHash_salt(String hash_salt) {
		this.hash_salt = hash_salt;
	}
}
