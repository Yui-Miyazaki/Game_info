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
		console.log(result.error);
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
				let breakIn = result.breakIn;
				if(breakIn === null){
					breakIn = "未入力";
				}
				let breakEnd = result.breakEnd;
				if(breakEnd === null){
					breakEnd = "未入力";
				}
				let clockEnd = result.clockEnd;
				if(clockEnd === null){
					clockEnd = "未入力";
				}
           $("#attendanceResult").append(
                   "<tr>"+ 
                    "<td>" + result.workingDay + "</td>" + 
                    "<td>" + result.clockIn + "</td>" +
                    "<td>" + breakIn + "</td>" + 
                    "<td>" + breakEnd + "</td>" +
                    "<td>" + clockEnd + "</td>" +
                    "</tr>"
		);
	});
}).fail(function() {
	 console.error("エラー内容:", textStatus, errorThrown);
	alert("読み込み失敗");
	});
});