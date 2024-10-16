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
<link rel="stylesheet" href="CSS/common/btn.css">
<link rel="stylesheet" href="CSS/formCSS/form.css">
<title>在庫管理一覧画面</title>
</head>
<body>
	<h1>在庫管理一覧</h1>
	<div class="searchForm">
	<form  action="stockSearch" method="post">
	<h2>search</h2>
	<span>商品名</span>
	<input type="text" class="textBox" name="gameName" placeholder="ゲーム名を入力してください。">
	<span>メーカー</span>
	<input type="text" class="textBox" name="maker" placeholder="メーカー名を入力してください。">
	<span>在庫数</span>
	<select  name="stock"class="selectBox">
		<%for(int i = 1;i <= 10;i++) {%>
			<option><%=i %></option>
		<%} %>
	</select>
	<input type="submit" class="btn" value="検索🔍">
	</form>
	</div>
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
			<th colspan="2">
	<form action="stockAdd" method="get">
		<input type="submit" class="regist_btn" value="新規登録">
	</form>
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
				<form action="stockUpdate" method="get">
					<input type="submit" class="update_btn" value="更新">
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
	</div>
	<form action="menu" method="get">
	<input type="submit" class="btn" value="メニュー画面へ">
	</form><br>
	<div class="logout_btn">
	<form action="logout" method="get">
		<input type="submit" class="resetBtn" value="ログアウト">
	</form>
	</div>
</body>
</html>