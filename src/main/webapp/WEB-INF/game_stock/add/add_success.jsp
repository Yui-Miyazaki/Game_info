<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="javaScript/common.js"></script>
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/common/result_page.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<title>追加成功画面</title>
</head>
<body>
	<div class="main">
		<h1 class="successMessage">Add Success!</h1>
		<form id="stockListForm" action="stockList" method="get">
			<input type="button" class="btn" value="在庫一覧へ" onclick="audio('stockListForm')">
		</form>
		<audio id="btnClick_audio">
			<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
		</audio>
	</div>
</body>
</html>