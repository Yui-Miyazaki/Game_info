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
		alert(result.status);
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
			
			$.each(result.list, function(index, listItem) {
				let breakIn = listItem.breakIn;
				if(breakIn === null){
					breakIn = "未入力";
				}
				let breakEnd = listItem.breakEnd;
				if(breakEnd === null){
					breakEnd = "未入力";
				}
				let clockEnd = listItem.clockEnd;
				if(clockEnd === null){
					clockEnd = "未入力";
				}
           $("#attendanceResult").append(
			   
                   "<tr>"+ 
                    "<td>" + listItem.workingDay + "</td>" + 
                    "<td>" + listItem.clockIn + "</td>" +
                    "<td>" + listItem.breakIn + "</td>" + 
                    "<td>" + listItem.breakEnd + "</td>" +
                    "<td>" + listItem.clockEnd + "</td>" +
                    "</tr>"
		);
	});
}).fail(function() {
	alert("読み込み失敗");
	});
});