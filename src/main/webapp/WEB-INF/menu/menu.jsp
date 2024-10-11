<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メニュー画面</title>
</head>
<body>
<div>
       <h1>メニュー</h1>
       <form action="stockList" method="get">
			<div>
				<button type="submit">在庫管理一覧</button>
		</div>
		</form>
		<form action="employeeList" method="get">
			<div>
				<button type="submit">従業員一覧</button>
		</div>
		</form>
		<form action="logout" method="get">
		<div>
				<button type="submit">ログアウト</button>
		</div>
		</form>
 </div>
</body>
</html>