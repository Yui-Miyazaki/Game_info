function audio(formId) {
    document.getElementById('btnClick_audio').currentTime = 0; 
    document.getElementById('btnClick_audio').play();
    setTimeout(function() {
                document.getElementById(formId).submit();
    },250);
}

$("#search").on('click', function() {
	alert("a");
	$.ajax({
		type: "get",
		url: "ajax",
		data: {
			gameName: ("gameName"),
			maker: ("maker"),
			stock: ("stock")
		},
		dataType: "json"
	}).done(function(result) {
		let game = result[0];
		
		alert(game.gameId);
		alert("ajax");
		$("#gameName").html(result)
	}).fail(function() {

		alert("読み込み失敗");

	});
});