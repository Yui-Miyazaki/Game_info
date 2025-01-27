<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String errorMessage = (String)request.getAttribute("errorMessage"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="javaScript/common.js"></script>
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<link rel="stylesheet" href="CSS/loginCSS/login.css">
<title>ログイン画面</title>
</head>
<body>
	<h1>ログイン画面</h1>
	<main>
	<div class="main">
		<%if(errorMessage != null) {%>
		<span class="errorMessage"><%=errorMessage %></span>
		<%} %>
		<form id="loginForm" action="login" method="post">
			<span>ログインID</span><br>
			<input type="text" class="textBox" name="loginId"><br>
			<span>パスワード</span><br>
			<input type="password" class="textBox" name="password"><br>
			<input type="button" class="btn" value="ログイン" onclick="audio('loginForm')">
		</form><br>
		<form id="loginRegisterForm" action="loginRegister" method="get">
			<input type="button" class="btn" value="新規登録" onclick="audio('loginRegisterForm')">
		</form>
	</div>
	</main>
	<audio id="btnClick_audio">
		<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
	</audio>
</body>
</html>