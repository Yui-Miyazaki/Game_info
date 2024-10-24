$(function(){
  $('#searchResult').on('click','.check', function() {
    if ($(this).prop('checked')){
      // 一旦全てをクリアして再チェックする
      $('.check').prop('checked', false);
      $(this).prop('checked', true);
    }
  });
});
$(function(){
	$('#updateBtn').on('click',function(){
		alert("a");
let element = document.getElementById('check');
console.log(element);
	});
});