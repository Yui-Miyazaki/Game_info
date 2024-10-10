<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String gameName = (String) session.getAttribute("gameName");
    String itemCode = (String) session.getAttribute("itemCode");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>在庫更新画面</title>
</head>
<body>
<h1>在庫更新画面</h1>
<h2><%=gameName %></h2>
<form action="stockUpdate" method="post">
     在庫数
		<select name="stock">
		<%for(int i = 1;i <= 10;i++){ %>
			<option>
			<%=i %>
			<%} %>
			</option>
		</select><br>
		販売価格
		<input type="text" name="price"><br>
		人気
		<select name="ranking">
		<%for(int i = 1;i <= 10;i++){ %>
			<option>
			<%=i %>
			<%} %>
			</option>
		</select><br>
		<input type="hidden" name="itemCode" value=<%=itemCode %>>
		<input type="submit" value="更新">
		</form>
		<form action="stockList" method="get">
	<input type="submit" value="在庫一覧へ">
	</form>
</body>
</html>