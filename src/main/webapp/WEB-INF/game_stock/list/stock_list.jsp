<%@page import="model.entity.GameBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%List<GameBean> searchResultList = (List<GameBean>)session.getAttribute("searchResultList"); %>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="javaScript/Ajax.js"></script>
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
		<%for(int i = 1;i <= 10;i++) {%>
			<option><%=i %></option>
		<%} %>
	</select>
	<input type="button" class="searchBtn" id="search" name="searchBtn" value="検索🔍" onclick="audio('searchForm')">
	<input type="button" class="searchBtn" id="allBtn" name="allGetBtn" value="全件表示" onclick="audio('searchForm')">
	
	</div>
	<div class="btnform">
	<form id="stockAddForm" action="stockAdd" method="get">
		<input type="button" class="regist_btn" value="新規登録" onclick="audio('stockAddForm')">
	</form>
	<form action="?" method="get">
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
	</table>
	<button type="button" class="btn" id="updateBtn" onclick="multipleaction('stockUpdate')" >更新</button>
	<input type="hidden" name="gameName" value="result.gameName">
	<input type="hidden" name="itemCode" value="result.itemCode">
	
	<button type="button" class="btn" 	 onclick="multipleaction('stockDelete')">削除</button>
	<input type="hidden" name="gameName" value="result.gameName">
	<input type="hidden" name="itemCode" value="result.itemCode">
	</form>
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
<script defer>	
$(".searchBtn").on('click', function() {
	$.ajax({
		type: "get",
		url: "ajax",
		data: {
			gameName: $("#gameName").val(),
			maker: $("#maker").val(),
			stock: $("#stock").val(),
			searchBtn : $(this).val(),
		},
		dataType: "json"
	}).done(function(result) {
		$("#searchResult").empty();
        $("#searchResult").append(
        		"<tr>" +
    			"<th class=\"column_name\">ゲームID</th>" +
    			"<th class=\"column_name\">ゲーム名</th>" +
    			"<th class=\"column_name\">メーカー</th>" +
    			"<th class=\"column_name\">発売日</th>" +
    			"<th class=\"column_name\">在庫数</th>" +
    			"<th class=\"column_name\">価格</th>" +
    			"<th class=\"column_name\">人気</th>" +
    			"<th class=\"column_name\">商品コード</th>" +
    			"<th class=\"column_name\">選択</th>" +
    			"</tr>"
                );
		$.each(result, function(index, result) {
           $("#searchResult").append(
                   "<tr>"+
                    "<td>" + result.gameId + "</td>" + 
                    "<td>" + result.gameName + "</td>" +
                    "<td>" + result.maker + "</td>" +
                    "<td>" + result.releseDate + "</td>" +
                    "<td>" + result.stock + "</td>" +
                    "<td>" + result.price + "</td>" +
                    "<td>" + result.ranking + "</td>" +
                    "<td>" + result.itemCode + "</td>" +
                    "<td>" + "<input type=\"checkbox\" id=\"check\" name=\"check\" class=\"check\" value="">" + "</td>" +
                    "</tr>" 
                   ); 
        });
        
	}).fail(function() {
		alert("読み込み失敗");
	});
});
</script>
</body>
</html>