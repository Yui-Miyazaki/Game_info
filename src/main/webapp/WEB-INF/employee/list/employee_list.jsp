<%@page import="java.util.List"%>
<%@page import="model.entity.EmployeeBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<EmployeeBean> employeeList = (List) session.getAttribute("employeeList");
String errorMessage = (String)request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="javaScript/common.js"></script>
<script src="javaScript/form.js"></script>
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<link rel="stylesheet" href="CSS/registPageCSS/list_page.css">
<title>従業員一覧</title>
</head>
<body>
	<jsp:include page="../../header/header.jsp" />
	<h1>従業員一覧</h1>
	<h1><%=errorMessage %></h1>
	<form id="employeeForm" method="get">
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
				<input type="checkbox" name="employeeId" value=<%=employee.getEmployeeId()%>>
			</td>
		</tr>
		<%
		}
		%>
	</table>
	<input type="button" class="update_btn" value="更新" onclick="submitForm('employeeUpdate')">
	<input type="button" class="deleteBtn" value="削除" onclick="submitForm('employeeDelete')">
	</form>
	<!--  <form id="employeeAddForm" action="employeeAdd" method="get">
					<input type="button" class="regist_btn" value="新規登録" onclick="audio('employeeAddForm')">
				</form>-->
	<form id="menuForm" action="menu" method="get">
		<input type="button" class="btn" value="メニュー画面" onclick="audio('menuForm')">
	</form>
	<audio id="btnClick_audio">
		<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
	</audio>
</body>
</html>