<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="javaScript/common.js"></script>
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<link rel="stylesheet" href="CSS/common/result_page.css">
<title>更新成功画面</title>
</head>
<body>
<jsp:include page="../../header/header.jsp" />
<div class="main">
	<h1>Update Success！</h1>
	<form id="employeeListForm" action="employeeList" method="get">
		<input type="button" class="btn" value="従業員一覧へ" onclick="audio('employeeListForm')">
	</form>
	<audio id="btnClick_audio">
		<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
	</audio>
</div>
</body>
</html>