<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%int employeeId = (int)session.getAttribute("employeeId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>削除失敗画面</title>
</head>
<body>
	<h1>Delete Error!</h1>
	<form action ="employeeDelete" method="get">
	<input type="hidden" name="employeeId" value=<%=employeeId %>>
	<input type="submit" value="戻る">
	</form>
</body>
</html>