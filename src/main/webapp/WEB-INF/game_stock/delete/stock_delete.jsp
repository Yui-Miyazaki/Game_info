<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String gameName = (String) session.getAttribute("gameName");
%>
<%
String itemCode = (String) session.getAttribute("itemCode");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="javaScript/common.js"></script>
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/registPageCSS/list_page.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<title>在庫削除画面</title>
</head>
<body>
<jsp:include page="../../header/header.jsp" />
	<h1>在庫削除画面</h1>
	<h2><%=gameName%>を削除しますか？
	</h2>
	<form id="stockDeleteForm" action="stockDelete" method="post">
		<input type="hidden" name="itemCode" value=<%=itemCode%>> 
		<input type="button" class="deleteBtn" value="削除" onclick="audio('stockDeleteForm')"><br>
		<br>
	</form>
	<form id="stockListForm" action="stockList" method="get">
		<input type="button" class="btn" value="在庫一覧へ"
			onclick="audio('stockListForm')">
	</form>
	<audio id="btnClick_audio">
		<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
	</audio>
</body>
</html>