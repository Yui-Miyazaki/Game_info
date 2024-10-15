<%@page import="model.entity.EmployeeBean"%>
<%@page import="model.entity.PostBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<PostBean> postList = (List) session.getAttribute("postList");
EmployeeBean employee = (EmployeeBean) session.getAttribute("employee");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/formCSS/form.css">
<link rel="stylesheet" href="CSS/registPageCSS/list_page.css">
<title>更新画面</title>
</head>
<body>
	<h1>更新する従業員</h1>
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
	<main>
		<div class="main">
		<h2>更新情報入力</h2>
			<form action="employeeUpdate" method="post">
				<div class="flexItem">
					<span class="item">氏名</span> 
					<input type="text" class="textBox" name="name"><br>
				</div>
				<div class="flexItem">
					<span class="item">年齢</span> 
					<select name="age" class="selectBox">
						<%
						for (int i = 18; i <= 60; i++) {
						%>
						<option>
							<%=i%>
						</option>
						<%
						}
						%>
					</select><br>
				</div>
				<div class="flexItem">
					<span class="item">役職</span> 
					<select name="postCode" class="selectBox">
						<%
						for (PostBean post : postList) {
						%>
						<option value=<%=post.getPostCode()%>>
							<%=post.getPostName()%>
						</option>
						<%
						}
						%>
					</select><br>
				</div>
				<input type="submit" class="btn" value="更新">
			</form>
		</div>
		<form action="employeeList" method="get">
			<input type="submit" class="btn" value="従業員一覧へ">
		</form>

	</main>
</body>
</html>