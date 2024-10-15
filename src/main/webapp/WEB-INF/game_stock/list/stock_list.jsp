<%@page import="model.entity.GameBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<GameBean> stockList = (List<GameBean>)session.getAttribute("stockList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/registPageCSS/list_page.css">
<title>在庫管理一覧画面</title>
</head>
<body>
	<h1>在庫管理一覧</h1>
	<form class="search_box" action="stockSearch" method="post">
	<input type="text" class="textBox" name="gameName" placeholder="ゲーム名を入力してください。">
	<input type="text" class="textBox" name="maker" placeholder="メーカー名を入力してください。">
	<select  name="stock"class="textBox">
		<%for(int i = 1;i <= 10;i++) {%>
			<option class="selectBox" value="在庫数">
			<%=i %></option>
		<%} %>
	</select>
	<input type="submit" class="btn" value="検索🔍">
	</form>
	<table border="1" class="list">
		<tr>
			<th>ゲームID</th>
			<th>ゲーム名</th>
			<th>メーカー</th>
			<th>発売日</th>
			<th>在庫数</th>
			<th>販売価格</th>
			<th>人気</th>
			<th>商品コード</th>
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
				<form action="stockUpdate" method="get">
					<input type="submit" class="btn" value="更新">
					<input type="hidden" name="gameName" value=<%=game.getGameName()%>>
					<input type="hidden" name="itemCode"  value=<%=game.getItemCode()%>>
				</form>
			</td>
			<td>
				<form action="stockDelete" method="get">
					<input type="submit" class="deleteBtn" value="削除">
					<input type="hidden" name="gameName" value=<%=game.getGameName()%>>
					<input type="hidden" name="itemCode"  value=<%=game.getItemCode()%>>
				</form>
			</td>
		</tr>
		<%
		}
		%>
	</table>
	<div class="btn_box">
	<form action="stockAdd" method="get">
		<input type="submit" class="btn" value="新規登録">
	</form>
	</div>
	<div class="logout_btn">
	<form action="logout" method="get">
		<input type="submit" class="resetBtn" value="ログアウト">
	</form>
	</div>
</body>
</html>