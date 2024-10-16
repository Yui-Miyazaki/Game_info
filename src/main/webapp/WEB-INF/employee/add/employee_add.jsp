<%@page import="model.entity.PostBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
List<PostBean> postList = (List) session.getAttribute("postList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="javaScript/common.js"></script>
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<link rel="stylesheet" href="CSS/formCSS/form.css">
<title>従業員追加画面</title>
</head>
<body>
	<h1>従業員追加画面</h1>
	<div class="main">
	<h2>登録情報入力</h2>
	<form id="employeeAddForm" action="employeeAdd" method="post">
		<div class="flexItem">
			<span class="item">氏名</span> <input type="text" class="textBox" name="name"><br>
		</div>
		<div class="flexItem">
		<span class="item">年齢</span> 
		<select name="age" class="selectBox">
			<%for (int i = 18; i <= 60; i++) {%>
			<option class="selectBox">
				<%=i%>
			</option>
			<%}%>
		</select><br>
		</div>
		<div class="flexItem"> 
		<span class="item">役職</span> <select name="postCode" class="selectBox">
			<%for (PostBean post : postList) {%>
			<option value=<%=post.getPostCode()%>>
				<%=post.getPostName()%>
			</option>
			<%}%>
		</select><br>
		</div> 
		<input type="button" class="btn" value="登録" onclick="audio('employeeAddForm')">
	</form>
	</div>
	<form id="employeeListForm" action="employeeList" method="get">
		<input type="button" class="btn" value="従業員一覧へ" onclick="audio('employeeListForm')">
	</form>
	<audio id="btnClick_audio">
		<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
	</audio>
</body>
</html>