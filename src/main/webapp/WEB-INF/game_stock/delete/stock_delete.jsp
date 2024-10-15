<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String gameName = (String) session.getAttribute("gameName"); %>
    <%String itemCode = (String) session.getAttribute("itemCode"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/registPageCSS/list_page.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<title>在庫削除画面</title>
</head>
<body>
<h1>在庫削除画面</h1>
<h2><%=gameName %>を削除しますか？</h2>
<form action="stockDelete" method="post">
<input type="hidden" name="itemCode" value=<%=itemCode %>>
<input type="submit" class="deleteBtn" value="削除"><br><br>
</form>
	<form action="stockList" method="get">
	<input type="submit" class="btn" value="在庫一覧へ">
	</form>
</body>
</html>