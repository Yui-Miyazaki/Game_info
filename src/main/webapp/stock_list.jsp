<%@page import="model.entity.GameBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<GameBean> stockList = (List<GameBean>)session.getAttribute("stockList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>在庫管理一覧画面</title>
</head>
<body>
	<h1>在庫管理一覧</h1>
	<table border="1">
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
					<input type="submit" value="更新">
					<input type="hidden" name="gameName" value=<%=game.getGameName()%>>
					<input type="hidden" name="itemCode"  value=<%=game.getItemCode()%>>
				</form>
			</td>
			<td>
				<form action="stockDelete" method="get">
					<input type="submit" value="削除">
					<input type="hidden" name="gameName" value=<%=game.getGameName()%>>
					<input type="hidden" name="itemCode"  value=<%=game.getItemCode()%>>
				</form>
			</td>
		</tr>
		<%
		}
		%>
	</table>
	<form action="stockAdd" method="get">
		<input type="submit" value="追加">
	</form>
	<form action="logout" method="get">
		<input type="submit" value="ログアウト">
	</form>
	<form action="stockSearch" method="post">
	<input type="text" name="gameName" placeholder="ゲーム名を入力してください。">
	<input type="text" name="maker" placeholder="メーカー名を入力してください。">
	<select name="stock">
		<%for(int i = 1;i <= 10;i++) {%>
			<option><%=i %></option>
		<%} %>
	</select>
	<input type="submit" value="🔍">
	</form>
</body>
</html>