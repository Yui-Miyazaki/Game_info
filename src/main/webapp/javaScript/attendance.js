$(".attedanceBtn").on('click', function() {
	$.ajax({
		type: "post",
		url: "attendance",
		data: {
			attedanceBtn: $(this).val(),
			employeeId: $('#employeeId').val()
		}
	}).done(function() {
		$("#attendanceResult").empty();
		$("#attendanceResult").append(
			"<tr>" +
			"<th class=\"column_name\">出勤</th>" +
			"<th class=\"column_name\">休憩開始</th>" +
			"<th class=\"column_name\">休憩終了</th>" +
			"<th class=\"column_name\">退勤</th>" +
			"</tr>"
		);
	});

}).fail(function() {
	alert("読み込み失敗");
});