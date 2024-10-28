<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="javaScript/common.js"></script>
<script src="javaScript/header.js"></script>
<link rel="stylesheet" href="CSS/common/btn.css">
<link rel="stylesheet" href="CSS/common/header.css">
</head>
<header class="header">
	<div class="header__imageBox">
		<img class="header__headerIcon" src="img/header_bento.png">
	</div>
	<div id="customAlert" class="modal">
		<div class="modal-content">
			<form id="menuForm" action="menu" method="get">
				<input type="button" class="btn" id="menuBtn" value="メニュー画面"
					onclick="audio('menuForm')">
			</form>
			<form id="logoutForm" action="logout" method="get">
				<input type="button" class="resetBtn" id="logoutBtn" value="ログアウト"
					onclick="audio('logoutForm')">
			</form>
			<button id="closeModal" class="closeBtn">×</button>
		</div>
	</div>
</header>
<audio id="btnClick_audio">
	<source src="sounds/PC-Mouse05-1.mp3" type="audio/mp3">
</audio>
