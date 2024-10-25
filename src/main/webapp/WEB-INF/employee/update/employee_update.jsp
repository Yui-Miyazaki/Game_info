<%@page import="model.entity.EmployeeBean"%>
<%@page import="model.entity.PostBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<PostBean> postList = (List) session.getAttribute("postList");
List<EmployeeBean> updateEmployeeList = (List) session.getAttribute("updateEmployeeList");
String errorMessage = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="javaScript/common.js"></script>
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<link rel="stylesheet" href="CSS/formCSS/form.css">
<link rel="stylesheet" href="CSS/registPageCSS/list_page.css">
<title>更新画面</title>
</head>
<body>
	<jsp:include page="../../header/header.jsp" />
	<div class="main">
	<h1>更新する従業員</h1>
	<%for(EmployeeBean employee : updateEmployeeList) {%>
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
			<h2>更新情報入力</h2>
			<form id="employeeUpdateForm" action="employeeUpdate" method="post">
			<%if (errorMessage != null) { %>
				<span><%=errorMessage%></span>
			<%} %>
				<div class="flexItem">
					<span class="item">氏名</span> <input type="text" class="textBox"
						name="name"><br>
				</div>
				<div class="flexItem">
					<span class="item">年齢</span> <select name="age" class="selectBox">
						<%for (int i = 18; i <= 60; i++) {%>
						<option>
							<%=i%>
						</option>
						<%}%>
					</select><br>
				</div>
				<div class="flexItem">
					<span class="item">役職</span> 
					<select name="postCode" class="selectBox">
						<% for (PostBean post : postList) { %>
						<option value=<%=post.getPostCode()%>>
							<%=post.getPostName()%>
						</option>
						<% } %>
					</select><br>
				</div>
				<% }%>
				<input type="button" class="btn" value="更新"
					onclick="audio('employeeUpdateForm')">
			</form>
		</div>
		<form id="employeeListForm" action="employeeList" method="get">
			<input type="button" class="btn" value="従業員一覧へ"
				onclick="audio('employeeListForm')">
		</form>
		<audio id="btnClick_audio">
			<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
		</audio>
</body>
</html>