<%@page import="java.util.List"%>
<%@page import="model.entity.EmployeeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%List<EmployeeBean> employeeList = (List) session.getAttribute("employeeList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>従業員一覧</h1>
<table border="1">
		<tr>
			<th>社員番号</th>
			<th>氏名</th>
			<th>年齢</th>
			<th>役職</th>
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
				<input type="submit" value="更新">
			</form>
			</td>
			<td>
				<form action="employeeDelete" method="get">
				<input type="hidden" name="employeeId" value=<%=employee.getEmployeeId()%>>
				<input type="submit" value="削除">
			</form>
			</td>
			</tr>
			<%} %>
			</table>
			<form action="employeeAdd" method="get">
			<input type="submit" value="新規登録">
			</form>
</body>
</html>