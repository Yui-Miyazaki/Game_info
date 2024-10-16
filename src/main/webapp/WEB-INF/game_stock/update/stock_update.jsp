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
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/common/result_page.css">
<link rel="stylesheet" href="CSS/formCSS/form.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<title>在庫更新画面</title>
</head>
<body>
<jsp:include page="../../header/header.jsp" />
	<h1>在庫更新画面</h1>
	<div class="main">
		<h2><%=gameName%></h2>
		<form id="stockUpdateForm" action="stockUpdate" method="post">
			<div class="flexItem">
				<span class="item">在庫数</span> <select class="selectBox" name="stock">
					<%
					for (int i = 1; i <= 10; i++) {
					%>
					<option>
						<%=i%>
						<%
						}
						%>
					</option>
				</select><br>
			</div>
			<div class="flexItem">
				<span class="item">販売価格</span><input type="number" class="textBox"
					name="price" placeholder="円"><br>
			</div>
			<div class="flexItem">
				<span class="item">人気</span> <select name="ranking"
					class="selectBox">
					<%
					for (int i = 1; i <= 10; i++) {
					%>
					<option>
						<%=i%>
						<%
						}
						%>
					</option>
				</select><br>
			</div>
			<input type="hidden" name="itemCode" value=<%=itemCode%>> 
			<input type="button" class="btn" value="更新" onclick="audio('stockUpdateForm')">
		</form>
	</div>
	<form id="stockListForm" action="stockList" method="get">
		<input type="button" class="btn" value="在庫一覧へ" onclick="audio('stockListForm')">
	</form>
	<audio id="btnClick_audio">
		<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
	</audio>
</body>
</html>