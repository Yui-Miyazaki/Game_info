<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/menuCSS/menu.css">
<title>メニュー画面</title>
</head>
<body>
	<header>
		<h1>メニュー</h1>
	</header>
	<main>
		<div class="main">
			<form action="stockList" method="get">
				<div>
					<button class="btn" type="submit">在庫管理一覧</button>
				</div>
			</form>
			<form action="employeeList" method="get">
				<div>
					<button class="btn" type="submit">従業員一覧</button>
				</div>
			</form>
		</div>
		<form action="logout" method="get">
			<div>
				<button class="resetBtn" type="submit">ログアウト</button>
			</div>
		</form>
	</main>
</body>
</html>