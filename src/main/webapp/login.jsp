<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String errorMessage = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script src="javaScript/common.js"></script>
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/loginCSS/login.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<title>ログイン画面</title>
</head>
<body>
	<header>
	<h1>Login</h1>
	</header>
	<div class="errorMessage">
	<% if (errorMessage != null) {%>
	<span> <%=errorMessage%></span>
	<% }%>
	</div>
	<main>
		<div class="main">
			<form  id="loginForm"action="login" method="post">
				<div>
					<label for="title">LoginID</label><br> 
					<input type="text"  class="textBox" name="loginId" id="title">
				</div>
				<div>
					<label for="password">Password</label><br> 
					<input type="password"class="textBox" name="password" id="title">
				</div>
				<div>
					<input type="button" class="btn" value="Login" onclick="audio('loginForm')">
					<input type="reset" class="resetBtn" value="Reset" >
				</div>
			</form>
		</div>
			<form  id="loginRegisterForm" action="hash" method="get">
			<input type="button" class="btn" value="新規登録" onclick="audio('loginRegisterForm')">
			</form>
	</main>
	<audio id="btnClick_audio">
		<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
	</audio>
</body>

</html>