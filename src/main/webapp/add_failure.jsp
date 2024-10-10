<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String name = (String)session.getAttribute("gameName"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>追加エラー画面</title>
</head>
<body>
<h1>Add Error!</h1>
<form action="stockAdd" method="get">
<input type="submit" value="戻る">
</form>
</body>
</html>