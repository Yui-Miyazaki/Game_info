package model.entity;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

public class AttendanceBean implements Serializable {
	private Date workingDay;
	private Time clockIn;
	private Time breakIn;
	private Time breakEnd;
	private Time clockEnd;
	
	public AttendanceBean() {	
	}

	public Date getWorkingDay() {
		return workingDay;
	}

	public void setWorkingDay(Date workingDay) {
		this.workingDay = workingDay;
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

	}
		

	