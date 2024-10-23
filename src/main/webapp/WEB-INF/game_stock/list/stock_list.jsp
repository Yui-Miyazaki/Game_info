<%@page import="model.entity.GameBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<GameBean> stockList = (List<GameBean>)session.getAttribute("stockList"); %>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="javaScript/Ajax.js"></script>
<meta charset="UTF-8">
<script src="javaScript/common.js"></script>
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/registPageCSS/list_page.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<link rel="stylesheet" href="CSS/formCSS/form.css">
<title>在庫管理一覧画面</title>
</head>
<body>
	<jsp:include page="../../header/header.jsp" />
	<h1>在庫管理一覧</h1>
	<div class="searchForm">
	<form id="searchForm" method="get">
	<h2>search</h2>
	<span>商品名</span>
	<input type="text" class="textBox" name="gameName" id="gameName"  placeholder="ゲーム名を入力してください。">
	<span>メーカー</span>
	<input type="text" class="textBox" name="maker" id="maker" placeholder="メーカー名を入力してください。">
	<span>在庫数</span>
	<select  name="stock"class="selectBox" id="stock">
		<%for(int i = 1;i <= 10;i++) {%>
			<option><%=i %></option>
		<%} %>
	</select>
	<input type="button" class="btn" id="search" value="検索🔍" onclick="audio('searchForm')">
	</form>
	</div>
	<div>
	<table border="1" class="list">
		<tr>
			<th class="column_name">ゲームID</th>
			<th class="column_name">ゲーム名</th>
			<th class="column_name">メーカー</th>
			<th class="column_name">発売日</th>
			<th class="column_name">在庫数</th>
			<th class="column_name">販売価格</th>
			<th class="column_name">人気</th>
			<th class="column_name">商品コード</th>
			<th colspan="2" class="column_name">
	<div class="colum_name">
	<form id="stockAddForm" action="stockAdd" method="get">
		<input type="button" class="regist_btn" value="新規登録" onclick="audio('stockAddForm')">
	</form>
	</div>
			</th>
			
		</tr>
		<%
		for (GameBean game : stockList) {
		%>
		<tr>
			<td><%=game.getGameId()%></td>
			<td><%=game.getGameName()%></td>
			<td><%=game.getMaker()%></td>
			<td><%=game.getReleseDate()%></td>
			<td><%=game.getStock()%></td>
			<td><%=game.getPrice()%></td>
			<td><%=game.getRanking()%></td>
			<td><%=game.getItemCode()%></td>
			<td>
				<form id="stockUpdateForm_<%=game.getGameId() %>" action="stockUpdate" method="get">
					<input type="button" class="update_btn" value="更新" onclick="audio('stockUpdateForm_<%=game.getGameId() %>')">
					<input type="hidden" name="gameName" value=<%=game.getGameName()%>>
					<input type="hidden" name="itemCode"  value=<%=game.getItemCode()%>>
				</form>
			</td>
			<td>
				<form id="stockDeleteForm <%=game.getGameId() %>" action="stockDelete" method="get">
					<input type="button" class="deleteBtn" value="削除" onclick="audio('stockDeleteForm <%=game.getGameId() %>')">
					<input type="hidden" name="gameName" value=<%=game.getGameName()%>>
					<input type="hidden" name="itemCode"  value=<%=game.getItemCode()%>>
				</form>
			</td>
		</tr>
		<%
		}
		%>
	</table>
	<table>
	<tr>
	<td id="gameName">
	
	</td>
	</tr>
	</table>
	</div>
	<div class="btn_box">
	</div>
	<form id="menuForm" action="menu" method="get">
	<input type="button" class="btn" value="メニュー画面へ" onclick="audio('menuForm')">
	</form><br>
	<div class="logout_btn">
	<form id="logoutForm" action="logout" method="get">
		<input type="button" class="resetBtn" value="ログアウト" onclick="audio('logoutForm')">
	</form>
	</div>
	<audio id="btnClick_audio">
		<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
	</audio>
<script>	
$("#search").on('click', function() {
	alert("a");
	$.ajax({
		type: "get",
		url: "ajax",
		data: {
			gameName: $("#gameName").val(),
			maker: $("#maker").val(),
			stock: $("#stock").val()
		},
		dataType: "json"
	}).done(function(result) {
		alert("ajax");
		alert(result.gameName);
	}).fail(function() {

		alert("読み込み失敗");

	});
});
</script>
</body>
</html>