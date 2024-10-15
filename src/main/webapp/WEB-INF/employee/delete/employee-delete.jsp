<%@page import="model.entity.EmployeeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
EmployeeBean employee = (EmployeeBean) session.getAttribute("employee");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/formCSS/form.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<link rel="stylesheet" href="CSS/registPageCSS/list_page.css">
<title>削除確認画面</title>
</head>
<body>
	<h1>以下の従業員情報を削除します。</h1>
	<table border="1" class="list">
		<tr>
			<th class="column_name">氏名</th>
			<th class="column_name">年齢</th>
			<th class="column_name">役職</th>
		</tr>
		<tr>
			<td><%=employee.getName()%></td>
			<td><%=employee.getAge()%></td>
			<td><%=employee.getPostName()%></td>
		</tr>
	</table>
	<form action="employeeDelete" method="post">
		<input type="submit" class="deleteBtn" value="削除">
	</form><br>
	<form action="employeeList" method="get">
		<input type="submit" class="btn" value="従業員一覧へ">
	</form>
</body>
</html>