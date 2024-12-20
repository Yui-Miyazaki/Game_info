<%@page import="model.entity.GameBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String errorMessage = (String)request.getAttribute("errorMessage");%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="javaScript/searchResultAjax.js"></script>
<script src="javaScript/checkBox.js"></script>
<script src="javaScript/multipleAction.js"></script>
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
	<h2>search</h2>
	<span>商品名</span>
	<input type="text" class="textBox" name="gameName" id="gameName"  placeholder="ゲーム名を入力してください。">
	<span>メーカー</span>
	<input type="text" class="textBox" name="maker" id="maker" placeholder="メーカー名を入力してください。">
	<span>在庫数</span>
	<select  name="stock"class="selectBox" id="stock">
		<%for(int i = 0;i <= 10;i++) {%>

			<option><%=i %></option>
		<%} %>
	</select>
	<input type="button" class="searchBtn" id="search" name="searchBtn" value="検索🔍" onclick="audio('searchForm')">
	<input type="button" class="searchBtn" id="allBtn" name="allGetBtn" value="全件表示" onclick="audio('searchForm')">
	
	</div>
	<%if(errorMessage != null){%>
		<span class="errorMessage"><%=errorMessage %></span>
	<%} %>
	<form action="" method="get" id="stockForm" name="searchList">
	<table border="1" class="list" id="searchResult">
		<tr>
			<th class="column_name">ゲームID</th>
			<th class="column_name">ゲーム名</th>
			<th class="column_name">メーカー</th>
			<th class="column_name">発売日</th>
			<th class="column_name">在庫数</th>
			<th class="column_name">販売価格</th>
			<th class="column_name">人気</th>
			<th class="column_name">商品コード</th>
			<th class="column_name">選択</th>
		</tr>
	</table><br>
	<div class="crudButtons">
	<button type="button" class="update_btn" onclick="multipleaction('stockUpdate')" >更新</button>
	<button type="button" class="deleteBtn" onclick="multipleaction('stockDelete')">削除</button>
	<button type="button" class="regist_btn" onclick="multipleaction('stockAdd')">新規登録</button>

	</div>
	</form>
	<audio id="btnClick_audio">
		<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
	</audio>
</body>
</html>