package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.AttendanceBean;

public class AttendanceDAO {
	public int attendanceRegist(int employeeId,Date workingDay,String attendanceType) throws ClassNotFoundException, SQLException {
		int regitCount = 0;
		String sql = "";
		if("出勤".equals(attendanceType)) {
			sql = "INSERT INTO t_Attendance(employee_id,working_day,clock_in)"
				   + "VALUES (?,?,CURRENT_TIME)";
		}else if("休憩開始".equals(attendanceType)) {
			sql =  "UPDATE t_Attendance SET break_in = CURRENT_TIME "
			        + "WHERE employee_id = ? AND working_day = ?";
		}else if("休憩終了".equals(attendanceType)) {
			sql =  "UPDATE t_Attendance SET break_end = CURRENT_TIME "
			        + "WHERE employee_id = ? AND working_day = ?";
		}else if("退勤".equals(attendanceType)) {
			sql =  "UPDATE t_Attendance SET clock_end = CURRENT_TIME "
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

public List<AttendanceBean> getAttendanceList(int employeeId) throws ClassNotFoundException, SQLException{
	List<AttendanceBean> attendanceList = new ArrayList<AttendanceBean>();
	String sql = "SELECT working_day,clock_in,break_in,break_end,clock_end FROM t_Attendance WHERE employee_id = ?";
	try(Connection con = ConnectionManager.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
		pstmt.setInt(1, employeeId);
		 ResultSet res = pstmt.executeQuery();
		 while(res.next()) {
			 AttendanceBean attendance = new AttendanceBean();
			 attendance.setWorkingDay(res.getDate("working_day"));
			 attendance.setClockIn(res.getTime("clock_in"));
			 attendance.setBreakIn(res.getTime("break_in"));
			 attendance.setBreakEnd(res.getTime("break_end"));
			 attendance.setClockEnd(res.getTime("clock_end"));
			 attendanceList.add(attendance);
		 }
	}
	return attendanceList;
} 
}