package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.AuthorityBean;
import model.entity.LoginBean;

public class LoginDAO {
	public int registLoginUser(String login,String salt,String hashPass,String authority) throws ClassNotFoundException, SQLException {
		int registHashCount = 0;
		String sql = "INSERT INTO m_login VALUES(?,?,?,?)";
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, login);
			pstmt.setString(2, salt);
			pstmt.setString(3, hashPass);
			pstmt.setString(4, authority);
			registHashCount = pstmt.executeUpdate();
			System.out.println(registHashCount);
		}
		return registHashCount;
	}
	public String getSalt(String loginId) throws ClassNotFoundException, SQLException {
		String salt = null;
		String sql = "SELECT salt FROM m_login WHERE login_id = ? ";
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, loginId);
			
			
			ResultSet res = pstmt.executeQuery();
			
			while(res.next()) {
				 salt = res.getString("salt");
			}
		
		}
		return salt;
	}
	public String loginCheck(String login_id, String hash_pass) throws ClassNotFoundException, SQLException {
		String authorityCode = null;
		String sql = "SELECT * FROM m_login WHERE login_id = ? AND hash_pass = ?";
		try(Connection con = ConnectionManager.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, login_id);
			pstmt.setString(2, hash_pass);
			ResultSet res = pstmt.executeQuery();
			if(res.next()) {
				authorityCode = res.getString("authority_code");
			}
		}
		return authorityCode;
	}
	public List<AuthorityBean> getAuthorityList() throws ClassNotFoundException, SQLException {
		List<AuthorityBean> authorityList = new ArrayList<AuthorityBean>();
		String sql = "SELECT * FROM m_authority;";
		try(Connection con = ConnectionManager.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				AuthorityBean authority = new AuthorityBean();
				authority.setAuthorityCode(res.getString("authority_code"));
				authority.setAuthorityName(res.getString("authority_name"));
				authorityList.add(authority);
			}
		}
		return authorityList;
	}
	public List<LoginBean> getLoginUserList() throws ClassNotFoundException, SQLException{
		List<LoginBean> loginUserList = new ArrayList<LoginBean>();
		String sql = "SELECT t1.login_id,t2.authority_name "
				+ "FROM m_login t1 JOIN m_authority t2 "
				+ "ON t1.authority_code = t2.authority_code";
		try(Connection con = ConnectionManager.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			ResultSet res = pstmt.executeQuery();
			while(res.next()) {
				LoginBean loginBean = new LoginBean();
				loginBean.setLoginId(res.getString("login_id"));
				loginBean.setAuthorityName(res.getString("authority_name"));
				loginUserList.add(loginBean);
			}
		}return loginUserList;
	}
	public int loginUserDelete(String loginId) throws ClassNotFoundException, SQLException {
		int deleteCount = 0;
		String sql = "DELETE FROM m_login WHERE login_id = ?";
		try(Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, loginId);
			deleteCount = pstmt.executeUpdate();
		}
		return deleteCount;
	}
}

