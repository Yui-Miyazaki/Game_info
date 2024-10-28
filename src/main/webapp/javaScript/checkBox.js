$(function() {
	$('#searchResult').on('click', '.check', function() {
		if ($(this).prop('checked')) {
			$('.check').prop('checked', false);
			$(this).prop('checked', true);
		}
	});
});
