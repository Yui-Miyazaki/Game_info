<%@page import="java.util.List"%>
<%@page import="model.entity.EmployeeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%List<EmployeeBean> employeeList = (List) session.getAttribute("employeeList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/common/common.css">
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
				<form action="employeeUpdate" method="get">
				<input type="hidden" name="employeeId" value=<%=employee.getEmployeeId()%>>
				<input type="submit" class="btn" value="更新">
			</form>
			</td>
			<td>
				<form action="employeeDelete" method="get">
				<input type="hidden" name="employeeId" value=<%=employee.getEmployeeId()%>>
				<input type="submit" class="deleteBtn" value="削除">
			</form>
			</td>
			</tr>
			<%} %>
			</table>
			<form action="employeeAdd" method="get">
			<input type="submit"  class="btn" value="新規登録">
			</form>
			<form action="menu" method="get">
			<input type="submit" class="btn" value="メニュー画面">
			</form>
</body>
</html>