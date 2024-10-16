<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="javaScript/common.js"></script>
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/common/result_page.css">
<link rel="stylesheet" href="CSS/formCSS/form.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<title>在庫追加画面</title>
</head>
<body>
	<h1>在庫追加画面</h1>
	<div class="main">
	<form id="stockAddForm" action="stockAdd" method="post">
	<div class="flexItem">
		<span class="item">商品名</span> <input type="text" class="textBox" name="gameName"><br>
		</div>
		<div class="flexItem">
		<span class="item">メーカー</span> <input type="text" class="textBox"name="maker"><br>
		</div> 
		<div class="flexItem">
		<span class="item">発売日</span> <input type="date" class="textBox" name="releaseDate"><br>
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
		<span class="item">商品コード</span> 
		<input type="text" class="textBox" name="itemCode"><br>
		</div>
		<input type="button" class="btn" value="登録" onclick="audio('stockAddForm')">
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