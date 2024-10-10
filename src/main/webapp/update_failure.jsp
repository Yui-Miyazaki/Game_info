<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String gameName = (String)session.getAttribute("gameName");
    String itemCode = (String)session.getAttribute("itemCode");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>更新エラー画面</title>
</head>
<body>
<h1>Update Error!</h1>
<form action="stockUpdate" method="get">
<input type="hidden" name="gameName" value=<%=gameName %>>
<input type="hidden" name="itemCode" value=<%=itemCode %>>
<input type="submit" value="戻る">
</form>
</body>
</html>