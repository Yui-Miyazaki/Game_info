<%@page import="model.entity.LoginBean"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%List<LoginBean> loginUserList = (List)session.getAttribute("loginUserList");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<link rel="stylesheet" href="CSS/registPageCSS/list_page.css">
<title>ログインユーザ一覧</title>
</head>
<body>
	<jsp:include page="../header/header.jsp" />
	<h1>ログインユーザ一覧</h1>
	<table border="1" class="list">
		<tr>
			<th class="column_name">ログインID</th>
			<th class="column_name">権限</th>
		</tr>
		<%
		for (LoginBean loginUser : loginUserList) {
		%>
		<tr>
			<td><%=loginUser.getLoginId()%></td>
			<td><%=loginUser.getAuthorityName()%></td>
			<td>
				<form id="loginDeleteForm_<%=loginUser.getLoginId()%>" action="loginDelete" method="post">
					<input type="hidden" name="loginId" value=<%=loginUser.getLoginId()%>> 
					<input type="hidden" name="authorityName" value=<%=loginUser.getAuthorityName()%>>
					<input type="hidden" name="pageId" value="userList">
					<input type="button" class="deleteBtn" value="削除" onclick="audio('loginDeleteForm_<%=loginUser.getLoginId()%>')">
				</form>
			</td>
		</tr>
		<%
		}
		%>
	</table>
	<form id="menuForm" action="menu" method="get">
		<input type="button" class="btn" value="メニュー画面" onclick="audio('menuForm')">
	</form>
	<audio id="btnClick_audio">
		<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
	</audio>
</body>
</html>