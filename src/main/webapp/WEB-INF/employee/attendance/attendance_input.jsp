<%@page import="model.entity.AttendanceBean"%>
<%@page import="java.util.List"%>
<%@page import="model.entity.LoginUserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	LoginUserBean loginUser = (LoginUserBean)session.getAttribute("loginUser");
	List<AttendanceBean> attendanceList = (List) session.getAttribute("attendanceList");
%>
<%=attendanceList %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script defer src="javaScript/attendance.js"></script>
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<link rel="stylesheet" href="CSS/formCSS/form.css">
<link rel="stylesheet" href="CSS/registPageCSS/list_page.css">
<title>勤怠入力画面</title>
</head>
<body>
	<h1>勤怠入力</h1>
    <h2>氏名 : <%=loginUser.getName() %></h2>
	<input type="hidden" id="employeeId" value=<%=loginUser.getEmployeeId() %>>
	<button class="attedanceBtn" value="出勤">出勤</button>
	<button class="attedanceBtn" value="休憩開始">休憩開始</button>
	<button class="attedanceBtn" value="休憩終了">休憩終了</button>
	<button class="attedanceBtn" value="退勤">退勤</button><br>
	<table class="list" id="attendanceResult">
	<tr>
    	<th class=column_name>出勤</th>
    	<th class=column_name>休憩開始</th>
    	<th class=column_name>休憩終了</th>
    	<th class=column_name>退勤</th>
    	</tr>
    	<%
    	if(attendanceList != null){
    	%>
    	<%for (AttendanceBean attenList : attendanceList){ %>
    	<tr>
    	<td><%=attenList.getWorkingDay() %> </td>
    	<td><%=attenList.getClockIn() %></td>
    	</tr>
    	<%} %>
    	<%} %>
	</table>
</body>
</html>