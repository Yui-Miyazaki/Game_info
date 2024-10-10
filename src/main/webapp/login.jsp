<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String errorMessage = (String)request.getAttribute("errorMessage");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
</head>
<body>
  <div>
       <h1>ログイン</h1>
       <%if(errorMessage != null) {%>
			<span><%=errorMessage %></span>
		<%} %>
       <form action="login" method="post">
       <div>
				<label for="title">ログインID</label><br>
				<input type="text" name="id" id="title">
			</div>
			<div>
				<label for="password">パスワード</label><br>
				<input type="password" name="pass" id="title">
			</div>
			<div>
				<input type="submit" value="ログイン">
				<input type="reset" value="取り消し">
		</div>
		</form>
 </div>
</body>
</html>