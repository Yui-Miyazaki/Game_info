<%@page import="model.entity.GameBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%List<GameBean> searchResultList = (List)request.getAttribute("searchResultList"); %>
    <%String error = (String)request.getAttribute("error");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(error != null){ %>
<h1><%=error %></h1>
<%} %>
<%if(!searchResultList.isEmpty()){ %>
<h1>検索結果</h1>
<table border="1">
		<tr>
			<th>ゲームID</th>
			<th>ゲーム名</th>
			<th>メーカー</th>
			<th>発売日</th>
			<th>在庫数</th>
			<th>販売価格</th>
			<th>人気</th>
			<th>商品コード</th>
		</tr>
		<%
		for (GameBean game : searchResultList ) {
		%>
		<tr>
			<td><%=game.getGameId()%></td>
			<td><%=game.getGameName()%></td>
			<td><%=game.getMaker()%></td>
			<td><%=game.getReleseDate()%></td>
			<td><%=game.getStock()%></td>
			<td><%=game.getPrice()%></td>
			<td><%=game.getRanking()%></td>
			<td><%=game.getItemCode()%></td>
			</tr>
			<%} %>
			</table>
			<%} %>
</body>
</html>