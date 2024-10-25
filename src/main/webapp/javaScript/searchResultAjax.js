$(function() {
$(".searchBtn").on('click', function() {
	$.ajax({
		type: "get",
		url: "ajax",
		data: {
			gameName: $("#gameName").val(),
			maker: $("#maker").val(),
			stock: $("#stock").val(),
			searchBtn : $(this).val(),
		},
		dataType: "json"
	}).done(function(result) {
		$("#searchResult").empty();
        $("#searchResult").append(
        		"<tr>" +
    			"<th class=\"column_name\">ゲームID</th>" +
    			"<th class=\"column_name\">ゲーム名</th>" +
    			"<th class=\"column_name\">メーカー</th>" +
    			"<th class=\"column_name\">発売日</th>" +
    			"<th class=\"column_name\">在庫数</th>" +
    			"<th class=\"column_name\">価格</th>" +
    			"<th class=\"column_name\">人気</th>" +
    			"<th class=\"column_name\">商品コード</th>" +
    			"<th class=\"column_name\">選択</th>" +
    			"</tr>"
                );
		$.each(result, function(index, result) {
           $("#searchResult").append(
                   "<tr>"+
                    "<td>" + result.gameId + "</td>" + 
                    "<td>" + result.gameName + "</td>" +
                    "<td>" + result.maker + "</td>" +
                    "<td>" + result.releseDate + "</td>" +
                    "<td>" + result.stock + "</td>" +
                    "<td>" + result.price + "</td>" +
                    "<td>" + result.ranking + "</td>" +
                    "<td>" + result.itemCode + "</td>" +
                    "<td>" + "<input type=\"checkbox\" id=\"check\" name=\"check\" class=\"check\" value=" + result.gameName + "," + result.itemCode + " >" + "</td>" + 
                    "</tr>" 
                   ); 
        });
        
	}).fail(function() {
		alert("読み込み失敗");
	});
});
});