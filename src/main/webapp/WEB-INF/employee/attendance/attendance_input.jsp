<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script defer src="javaScript/attendance.js"></script>
<link rel="stylesheet" href="CSS/common/common.css">
<link rel="stylesheet" href="CSS/common/btn.css">
<link rel="stylesheet" href="CSS/formCSS/form.css">
<link rel="stylesheet" href="CSS/registPageCSS/list_page.css">
<title>勤怠入力画面</title>
</head>
<body>
	<h1>勤怠入力</h1>
	<button class="attedanceBtn">出勤</button>
	<button class="attedanceBtn">休憩開始</button>
	<button class="attedanceBtn">休憩終了</button>
	<button class="attedanceBtn">退勤</button><br>
	
	<table class="list" id="attendanceResult">
	</table>
</body>
</html>