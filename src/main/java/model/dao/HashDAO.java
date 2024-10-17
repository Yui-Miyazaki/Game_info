package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class HashDAO {
public int registHash(String id,String salt,String hashPass) throws ClassNotFoundException, SQLException {
	int registHashCount = 0;
	String sql = "INSERT INTO m_login VALUES(?,?,?)";
	try(Connection con = ConnectionManager.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
		pstmt.setString(1, id);
		pstmt.setString(2, salt);
		pstmt.setString(3, hashPass);
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
		System.out.println(salt);
	}
	return salt;
}
}
