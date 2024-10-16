<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String name = (String) session.getAttribute("gameName");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script src="javaScript/common.js"></script>
<link rel="stylesheet" href="CSS/common/result_page.css">
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<title>追加エラー画面</title>
</head>

<body>
	<div class="main">
		<h1 class="errorMessage">Add Error!</h1>
		<form id="stockAddForm" action="stockAdd" method="get">
			<input type="button" class="btn" value="戻る" onclick="audio('stockAddForm')">
		</form>
	</div>
	<audio id="btnClick_audio">
		<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
	</audio>
</body>

</html>