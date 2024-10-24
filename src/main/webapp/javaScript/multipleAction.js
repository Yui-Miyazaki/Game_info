
function multipleaction(url) {
	let form = document.querySelector("form");
	let action = form.setAttribute("action", url);
	
	document.getElementById('btnClick_audio').currentTime = 0;
	document.getElementById('btnClick_audio').play();
	setTimeout(function() {
	document.querySelector("form").submit();
	
	}, 250);
	//alert("a");

}
