package model.entity;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;

public class AttendanceBean implements Serializable {
	private String workingDay;
	private Time clockIn;
	private Time breakIn;
	private Time breakEnd;
	private Time clockEnd;
	
	public AttendanceBean() {	
	}



	public Time getClockIn() {
		return clockIn;
	}

	public void setClockIn(Time clockIn) {
		this.clockIn = clockIn;
	}

	public Time getBreakIn() {
		return breakIn;
	}

	public void setBreakIn(Time breakIn) {
		this.breakIn = breakIn;
	}

	public Time getBreakEnd() {
		return breakEnd;
	}

	public void setBreakEnd(Time breakEnd) {
		this.breakEnd = breakEnd;
	}

	public Time getClockEnd() {
		return clockEnd;
	}

	public void setClockEnd(Time clockEnd) {
		this.clockEnd = clockEnd;
	}


	public String getWorkingDay() {
		return workingDay;
	}
 
	public void setWorkingDay(Date sqlWorkingDay) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); // 必要な形式を指定
        String workingDay = dateFormat.format(sqlWorkingDay);
		this.workingDay = workingDay;
	}
 





	}
		

	