	
$("#search").on('click', function() {
	alert("a");
	$.ajax({
		type: "get",
		url: "ajax",
		data: {
			gameName: $("#gameName").val(),
			maker: $("#maker").val(),
			stock: $("#stock").val(),
			btn : $("#search").val()
		},
		dataType: "json"
	}).done(function(result) {
		alert("ajax");
		alert(result.gameName);
	}).fail(function() {

		alert("読み込み失敗");

	});
});
