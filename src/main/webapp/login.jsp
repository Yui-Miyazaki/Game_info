<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String errorMessage = (String) request.getAttribute("errorMessage");
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/loginCSS/login.css">
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
			<form action="login" method="post">
				<div>
					<label for="title">LoginID</label><br> 
					<input type="text"  class="textBox" name="id" id="title">
				</div>
				<div>
					<label for="password">Password</label><br> 
					<input type="password"class="textBox" name="pass" id="title">
				</div>
				<div>
					<input type="submit" class="btn" value="Login">
					<input type="reset" class="resetBtn" value="Reset">
				</div>
			</form>
		</div>
	</main>
</body>

</html>