package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.EmployeeBean;
import model.entity.PostBean;

public class EmployeeDAO {
	public List<EmployeeBean> getEmployeeList() throws ClassNotFoundException, SQLException {
		List<EmployeeBean> employeeList = new ArrayList<EmployeeBean>();
		String sql = "SELECT t1.employee_id, t1.name, t1.age, t2.post_name "
				+ "FROM m_employee t1 JOIN m_post t2 "
				+ "ON t1.post_code = t2.post_code";
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				EmployeeBean employee = new EmployeeBean();
				employee.setEmployeeId(res.getInt("employee_id"));
				employee.setName(res.getString("name"));
				employee.setAge(res.getString("age"));
				employee.setPostName(res.getString("post_name"));
				employeeList.add(employee);
			}
		}
		return employeeList;
	}

	public int addEmployee(String name, int age, String postCode) throws ClassNotFoundException, SQLException {
		String sql = "INSERT INTO m_employee(name,age,post_code) VALUES(?,?,?)";
		int addEmployeeCount = 0;
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, name);
			pstmt.setInt(2, age);
			pstmt.setString(3, postCode);
			addEmployeeCount = pstmt.executeUpdate();
			System.out.println(addEmployeeCount);
		}
		return addEmployeeCount;
	}

	public List<PostBean> getPostList() throws ClassNotFoundException, SQLException {
		String sql = "SELECT * FROM m_post";
		List<PostBean> postList = new ArrayList<PostBean>();
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				PostBean post = new PostBean();
				post.setPostCode(res.getString("post_code"));
				post.setPostName(res.getString("post_name"));
				postList.add(post);
			}
		}
		return postList;
	}

	public EmployeeBean getEmployeeInfo(int employeeId) throws ClassNotFoundException, SQLException {
		EmployeeBean employee = null;
		String sql = "SELECT t1.name, t1.age, t2.post_name "
				+ "FROM m_employee t1 JOIN m_post t2 "
				+ "ON t1.post_code = t2.post_code WHERE employee_id = ?";
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, employeeId);
			ResultSet res = pstmt.executeQuery();
			if (res.next()) {
				employee = new EmployeeBean();
				employee.setName(res.getString("name"));
				employee.setAge(res.getString("age"));
				employee.setPostName(res.getString("post_name"));
			}
		}
		return employee;
	}

	public int employeeUpdate(String name, int age, String postCode, int employeeId)
			throws ClassNotFoundException, SQLException {
		int updateCount = 0;
		String sql = " UPDATE m_employee SET name = ?,age = ?,post_code = ? WHERE employee_id = ?;";
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setString(1, name);
			pstmt.setInt(2, age);
			pstmt.setString(3, postCode);
			pstmt.setInt(4, employeeId);
			updateCount = pstmt.executeUpdate();
		}
		return updateCount;
	}

	public int employeeDelete(int employeeId) throws ClassNotFoundException, SQLException {
		int deleteCount = 0;
		String sql = "DELETE FROM m_employee WHERE employee_id = ?;";
		try (Connection con = ConnectionManager.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, employeeId);
			deleteCount = pstmt.executeUpdate();
		}
		return deleteCount;

	}
}
