<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String loginId = (String)session.getAttribute("loginId");
String authorityName = (String)session.getAttribute("authorityName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="javaScript/common.js"></script>
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/formCSS/form.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<link rel="stylesheet" href="CSS/registPageCSS/list_page.css">
<title>ユーザ削除確認画面</title>
</head>
<body>
	<h1>削除確認画面</h1>
	<div class="main">
	<span>以下のユーザを削除します。よろしいですか？</span><br>
	<%if("管理者".equals(authorityName)) {%>
	<h2 class="errorMessage">管理者ユーザです</h2>
	<%} %>
	<form id="loginDeleteForm" action="loginDelete" method="post">
			<span class="item">ログインID:</span>
			<%=loginId %><br>
			<span class="item">権限:</span>
			<%=authorityName %><br><br>
			<input type="hidden" name="loginId" value=<%=loginId %>>
			<input type="hidden" name="pageId" value="deleteCheck">
			<input type="button" class="deleteBtn" value="削除" onclick="audio('loginDeleteForm')">
	</form>
	</div>
	<form id="loginUser" action="loginUserList" method="get">
				<button class="btn"  type="button" onclick="audio('loginUser')">戻る</button>
		</form>
		
	<audio id="btnClick_audio">
		<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
	</audio>
	
</body>
</html>