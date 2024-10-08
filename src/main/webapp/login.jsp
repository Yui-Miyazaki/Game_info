<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
</head>
<body>
  <div>
       <h1>ログイン</h1>
       <form action="login" method="post">
       <div>
				<label for="title">ログインID</label><br>
				<input type="password" name="id" id="title">
			</div>
			<div>
				<label for="password">パスワード</label><br>
				<textarea name="pass" id="login"></textarea>
			</div>
			<div>
				<button type="submit">ログイン</button><br>
				<a href="login">取り消し</a>
				
		</div>
		</form>
 </div>
</body>
</html>