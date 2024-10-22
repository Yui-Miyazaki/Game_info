<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String gameName = (String) session.getAttribute("gameName");
String itemCode = (String) session.getAttribute("itemCode");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="javaScript/common.js"></script>
<link rel="stylesheet" href="CSS/common/error_page.css">
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<title>削除エラー画面</title>
</head>
<body>
<jsp:include page="../../header/header.jsp" />
	<div class="main">
		<h1 class="errorMessage">Delete Error!</h1>
		<form id="stockDeleteForm" action="stockDelete" method="get">
			<input type="hidden" name="gameName" value=<%=gameName%>> 
			<input type="hidden" name="itemCode" value=<%=itemCode%>> 
			<input class="btn" type="button" value="戻る" onclick="audio('stockDeleteForm')">
		</form>
	</div>
	<audio id="btnClick_audio">
		<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
	</audio>
</body>
</html>