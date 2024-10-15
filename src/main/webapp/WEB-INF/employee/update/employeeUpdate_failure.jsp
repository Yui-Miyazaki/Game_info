<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%int employeeId = (int)session.getAttribute("employeeId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<link rel="stylesheet" href="CSS/common/result_page.css">
<title>更新失敗画面</title>
</head>
<body>
<div class="main">
	<h1 class="errorMessage">Update Error!</h1>
	<form action ="employeeUpdate" method="get">
	<input type="hidden" name="employeeId" value=<%=employeeId %>>
	<input type="submit" class="btn" value="戻る">
	</form>
</div>
</body>
</html>