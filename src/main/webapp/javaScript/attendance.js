$(".attedanceBtn").on('click', function() {
	$.ajax({
		type: "post",
		url: "attendance",
		data: {
			attedanceBtn : $(this).val(),
			employeeId : $('#employeeId').val()
 		}
//		dataType: "json"
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
//		$.each(result, function(index, result) {
//           $("#searchResult").append(
//                   "<tr>"+
//                    "<td>" + result.gameId + "</td>" + 
//                    "<td>" + result.gameName + "</td>" +
//                    "<td>" + result.maker + "</td>" +
//                    "<td>" + result.releseDate + "</td>" +
//                    "<td>" + result.stock + "</td>" +
//                    "<td>" + result.price + "</td>" +
//                    "<td>" + result.ranking + "</td>" +
//                    "<td>" + result.itemCode + "</td>" +
//                    "<td>" + "<input type=\"checkbox\" name=\"check\" class=\"check\"></td>" +
//                    "</tr>" +
//                    "<input type=\"button\" class=\"btn\" value=\"更新\">" +
//               	    "<input type=\"hidden\" name=\"gameName\" value=\"result.gameName\">" +
//               	    "<input type=\"hidden\" name=\"itemCode\" value=\"result.itemCode\">" +
//                    "<input type=\"button\" class=\"btn\" value=\"削除\">" +
//               	    "<input type=\"hidden\" name=\"gameName\" value=\"result.gameName\">" +
//               	    "<input type=\"hidden\" name=\"itemCode\" value=\"result.itemCode\">" 
//                   ); 
//        });
//        
	}).fail(function() {

		alert("読み込み失敗");

	});
});