
function multipleaction(url) {
	let form = document.querySelector("#stockForm");
	form.setAttribute("action", url);
    let element = $('#check:checked').val();
  
	
	document.getElementById('btnClick_audio').currentTime = 0;
	document.getElementById('btnClick_audio').play();
	setTimeout(function() {
	document.querySelector("#stockForm").submit();
	
	}, 250);
	

}

