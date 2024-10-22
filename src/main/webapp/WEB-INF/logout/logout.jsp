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
<title>ログアウト画面</title>
</head>
<body>
	<div class="main">
		<h1>ログアウトしました</h1>
		<form id="loginForm" action="login" method="get">
			<div>
				<button type="button" class="btn" onclick="audio('loginForm')">ログイン</button>
			</div>
		</form>
	</div>
	<audio id="btnClick_audio">
		<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
	</audio>
</body>
</html>