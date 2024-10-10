package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDAO {
	public int loginCheck(String id, String passeord) throws ClassNotFoundException, SQLException {
		int loginCheckCount = 0;
		String sql = "SELECT login_id FROM m_login WHERE login_id = ? AND password = ?;";
		try(Connection con = ConnectionManager.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			pstmt.setString(1, id);
			pstmt.setString(2, passeord);
			ResultSet res = pstmt.executeQuery();
			if(res.next()) {
				loginCheckCount += 1;
			}
		}
		return loginCheckCount;
	}

}
