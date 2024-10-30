$(".attedanceBtn").on('click', function() {
	$.ajax({
		type: "post",
		url: "attendance",
		data: {
			attedanceBtn: $(this).val(),
			employeeId: $('#employeeId').val()
		},
		dataType : "json"
	}).done(function(result) {
		console.log(result);
		$("#attendanceResult").empty();
		$("#attendanceResult").append(
			"<tr>" +
			"<th class=\"column_name\">出勤日</th>" +
			"<th class=\"column_name\">出勤</th>" +
			"<th class=\"column_name\">休憩開始</th>" +
			"<th class=\"column_name\">休憩終了</th>" +
			"<th class=\"column_name\">退勤</th>" +
			"</tr>" +
			"<tr>" 
			);
			
			$.each(result, function(index, result) {
           $("#attendanceResult").append(
                   "<tr>"+ 
                    "<td>" + result.workingDay + "</td>" + 
                    "<td>" + result.clockIn + "</td>" +
                    "<td>" + result.breakIn + "</td>" + 
                    "<td>" + result.breakEnd + "</td>" +
                    "<td>" + result.clockEnd + "</td>" +
                    "</tr>"
		);
	});
}).fail(function() {
	 console.error("エラー内容:", textStatus, errorThrown);
	alert("読み込み失敗");
	});
});