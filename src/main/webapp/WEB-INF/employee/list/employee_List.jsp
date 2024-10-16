<%@page import="java.util.List"%>
<%@page import="model.entity.EmployeeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<EmployeeBean> employeeList = (List) session.getAttribute("employeeList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="javaScript/common.js"></script>
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<link rel="stylesheet" href="CSS/registPageCSS/list_page.css">
<title>従業員一覧</title>
</head>
<body>
	<h1>従業員一覧</h1>
	<table border="1" class="list">
		<tr>
			<th class="column_name">社員番号</th>
			<th class="column_name">氏名</th>
			<th class="column_name">年齢</th>
			<th class="column_name">役職</th>
			<th class="column_name" colspan="2">
				<form id="employeeAddForm" action="employeeAdd" method="get">
					<input type="button" class="regist_btn" value="新規登録" onclick="audio('employeeAddForm')">
				</form>
			</th>
		</tr>
		<%
		for (EmployeeBean employee : employeeList) {
		%>
		<tr>
			<td><%=employee.getEmployeeId()%></td>
			<td><%=employee.getName()%></td>
			<td><%=employee.getAge()%></td>
			<td><%=employee.getPostName()%></td>
			<td>
				<form id="employeeUpdateForm_<%=employee.getEmployeeId() %>" action="employeeUpdate" method="get">
					<input type="hidden" name="employeeId" value=<%=employee.getEmployeeId()%>> 
					<input type="button" class="update_btn" value="更新" onclick="audio('employeeUpdateForm_<%=employee.getEmployeeId() %>')">
				</form>
			</td>
			<td>
				<form id="employeeDeleteForm_<%=employee.getEmployeeId()%>" action="employeeDelete" method="get">
					<input type="hidden" name="employeeId" value=<%=employee.getEmployeeId()%>> 
					<input type="button" class="deleteBtn" value="削除" onclick="audio('employeeDeleteForm_<%=employee.getEmployeeId()%>')">
				</form>
			</td>
		</tr>
		<%
		}
		%>
	</table>
	<form id="menuForm" action="menu" method="get">
		<input type="button" class="btn" value="メニュー画面" onclick="audio('menuForm')">
	</form>
	<audio id="btnClick_audio">
		<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
	</audio>
</body>
</html>