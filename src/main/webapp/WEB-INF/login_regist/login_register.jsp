<%@page import="model.entity.AuthorityBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
	String errorMessage = (String) request.getAttribute("errorMessage");
	List<AuthorityBean> authorityList = (List)session.getAttribute("authorityList");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="javaScript/common.js"></script>
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/common/result_page.css">
<link rel="stylesheet" href="CSS/formCSS/form.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<title>新規登録</title>
</head>
<body>
	<h1>新規登録</h1>
	<div class="errorMessage">
	<% if (errorMessage != null) {%>
	<%=errorMessage%>
	<% }%>
	</div>
	<div class="main">
	<form id="loginRegisterForm" action="loginRegister" method="post">
	    <div class="flexItem">
		    <label for="title" class="item">LoginID</label> 
		    <input type="text" class="textBox" name="id" id="title"><br>
		</div>
		<div class="flexItem">
			<label for="password" class="item">Password</label> 
			<input type="password" class="textBox" name="pass" id="password"><br>
		</div>
		<div class="flexItem">
			<label for="authority" class="item">Authority</label> 
			<select name="authority" class="selectBox">
			<%for(AuthorityBean authority : authorityList){ %>
			<option value=<%=authority.getAuthorityCode() %>><%=authority.getAuthorityName() %></option>
			<%} %>
			</select>
			<br>
		</div>
		<input type="button" class="btn" value="新規登録" onclick="audio('loginRegisterForm')">
	</form>
	</div>
	<form id="loginForm" action="loginUserList" method="get">
			<div>
				<button type="button" class="btn" onclick="audio('loginForm')">一覧画面へ</button>
		    </div>
		</form>
	<audio id="btnClick_audio">
		<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
	</audio>
</body>
</html>