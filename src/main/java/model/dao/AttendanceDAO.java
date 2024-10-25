package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AttendanceDAO {
	public int attendanceRegist(int employeeId,Date workingDay,String attendanceType) throws ClassNotFoundException, SQLException {
		int regitCount = 0;
		String sql = "";
		if("出勤".equals(attendanceType)) {
			sql = "INSERT INTO t_Attendance(employee_id,working_day,clock_in)"
				   + "VALUES (?,?,CURRENT_TIMESTAMP)";
		}else if("休憩開始".equals(attendanceType)) {
			sql =  "UPDATE t_Attendance SET break_in = CURRENT_TIMESTAMP "
			        + "WHERE employee_id = ? AND working_day = ?";
		}else if("休憩終了".equals(attendanceType)) {
			sql =  "UPDATE t_Attendance SET break_end = CURRENT_TIMESTAMP "
			        + "WHERE employee_id = ? AND working_day = ?";
		}else if("退勤".equals(attendanceType)) {
			sql =  "UPDATE t_Attendance SET clock_end = CURRENT_TIMESTAMP "
			        + "WHERE employee_id = ? AND working_day = ?";
		}
		try(Connection con = ConnectionManager.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql);){
			pstmt.setInt(1, employeeId);
			pstmt.setDate(2, workingDay);
			regitCount = pstmt.executeUpdate();
		}
		return regitCount;
	}
}
