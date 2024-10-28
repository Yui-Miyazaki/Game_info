package model.entity;

import java.io.Serializable;

public class LoginUserBean implements Serializable {
	private int employeeId;
	private String name;
	
	public LoginUserBean() {	
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}
