$(function() {
	$('#searchResult').on('click', '.check', function() {
		if ($(this).prop('checked')) {
			// 一旦全てをクリアして再チェックする
			$('.check').prop('checked', false);
			$(this).prop('checked', true);
		}
	});
});
$(function() {
	$('#updateBtn').on('click', function() {

		let element = $('#check:checked').val();
		let itemCode = $('#check:checked').val();
		console.log(element);
	});
});