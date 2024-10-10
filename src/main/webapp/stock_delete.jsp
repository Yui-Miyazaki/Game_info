<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String gameName = (String) session.getAttribute("gameName"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>在庫削除画面</title>
</head>
<body>
<h1>在庫削除画面</h1>
<h2><%=gameName %>を削除しますか？</h2>
<form action="stockDelete" method="post">
<input type="submit" value="削除">
</form>
	<form action="stockList" method="get">
	<input type="submit" value="在庫一覧へ">
	</form>
</body>
</html>