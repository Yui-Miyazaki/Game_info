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
<title>更新画面</title>
</head>
<body>
	<h1>更新する従業員</h1>
	<table border="1">
		<tr>
			<th>氏名</th>
			<th>年齢</th>
			<th>役職</th>
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
				<span>氏名</span> <input type="text" name="name"><br> <span>年齢</span>
				<select name="age">
					<%
					for (int i = 18; i <= 60; i++) {
					%>
					<option>
						<%=i%>
					</option>
					<%
					}
					%>
				</select><br> <span>役職</span> <select name="postCode">
					<%
					for (PostBean post : postList) {
					%>
					<option value=<%=post.getPostCode()%>>
						<%=post.getPostName()%>
					</option>
					<%
					}
					%>
				</select><br> <input type="submit" value="更新">
			</form>
			<form action="employeeList" method="get">
				<input type="submit" value="従業員一覧へ">
			</form>
		</div>
	</main>
</body>
</html>