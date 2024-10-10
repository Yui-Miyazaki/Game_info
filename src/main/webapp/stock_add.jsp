<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>在庫追加画面</title>
</head>
<body>
	<h1>在庫追加画面</h1>
	<form action="stockAdd" method="post">
		商品名 
		<input type="text" name="gameName"><br>
		メーカー
		<input type="text"name="maker"><br>
		発売日
		<input type="date" name="releaseDate"><br>
		在庫数
		<select name="stock">
		<%for(int i = 1;i <= 10;i++){ %>
			<option>
			<%=i %>
			<%} %>
			</option>
		</select><br>
		販売価格
		<input type="number" name="price"><br>
		人気
		<select name="ranking">
		<%for(int i = 1;i <= 10;i++){ %>
			<option>
			<%=i %>
			<%} %>
			</option>
		</select><br>
		商品コード
		<input type="text" name="itemCode"><br>
		<input type="submit" value="登録">
	</form>
	<form action="StockList" method="get">
	<input type="submit" value="在庫一覧へ">
	</form>
</body>
</html>