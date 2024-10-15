<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/common/result_page.css">
<link rel="stylesheet" href="CSS/formCSS/form.css">
<title>在庫追加画面</title>
</head>
<body>
	<h1>在庫追加画面</h1>
	<div class="main">
	<form action="stockAdd" method="post">
	<div class="flexItem">
		<span class="item">商品名</span> <input type="text" class="textBox" name="gameName"><br>
		</div>
		<div class="flexItem">
		<span class="item">メーカー</span> <input type="text" class="textBox"name="maker"><br>
		</div> 
		<div class="flexItem">
		<span class="item">発売日</span> <input type="date" name="releaseDate"><br>
		</div>
		<div class="flexItem">
		<span class="item">在庫数</span> <select name="stock" class="selectBox">
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
		 <span class="item">販売価格</span> <input type="number" class="textBox" name="price"><br>
		 </div>
		 <div class="flexItem">
		<span class="item">人気</span> <select name="ranking"class="selectBox">
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
		<span class="item">商品コード</span> <input type="text" class="textBox" name="itemCode"><br>
		</div>
		<input type="submit" value="登録">
	</form>
	</div>
	<form action="stockList" method="get">
		<input type="submit" value="在庫一覧へ">
	</form>
</body>
</html>