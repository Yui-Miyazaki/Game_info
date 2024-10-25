<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String authorityCode = (String)session.getAttribute("authorityCode"); %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<script src="javaScript/common.js"></script>
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/menuCSS/menu.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<title>メニュー画面</title>
</head>

<body>
	<header>
		<h1>メニュー</h1>
	</header>
	<main>
		<div class="main">
			<form id="stockListForm" action="stockList" method="get">
				<div>
					<button class="btn" type="button" onclick="audio('stockListForm')">在庫管理一覧</button>
				</div>
			</form>
			<form id="employeeForm" action="employeeList" method="get">
				<div>
					<button class="btn" type="button" onclick="audio('employeeForm')">従業員一覧</button>
				</div>
			</form>
			<%if((authorityCode != null) && "ADMIN".equals(authorityCode)){ %>
		<form id="loginUserForm" action="loginUserList" method="get">
			<div>
				<button class="loginDeleteBtn"  type="button" onclick="audio('loginUserForm')">ユーザ一覧</button>
			</div>
		</form>
		<%} %>
		<form id="attendanceForm" action="attendance" method="get">
				<button class="btn" type="button" onclick="audio('attendanceForm')">勤怠入力</button>
		</form>
		</div>
		<form id="logoutForm" action="logout" method="get">
			<div>
				<button class="resetBtn"  type="button" onclick="audio('logoutForm')">ログアウト</button>
			</div>
		</form>
	</main>
	<audio id="btnClick_audio">
		<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
	</audio>
</body>

</html>