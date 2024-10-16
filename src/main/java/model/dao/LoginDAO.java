package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
	public int loginCheck(String login_id, String hash_pass) throws ClassNotFoundException, SQLException {
		int loginCheckCount = 0;
		String sql = "SELECT * FROM m_login WHERE login_id = ? AND hash_salt = ?";
		try(Connection con = ConnectionManager.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, login_id);
			pstmt.setString(2, hash_pass);
		
			
			ResultSet res = pstmt.executeQuery();
			if(res.next()) {
				loginCheckCount += 1;
				System.out.println("a");
			}
		}
		return loginCheckCount;
	}

}
