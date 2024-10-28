function submitForm(action) {
		document.getElementById('btnClick_audio').currentTime = 0; 
   		document.getElementById('btnClick_audio').play();
        let form = document.getElementById("employeeForm");
        form.action = action;
        setTimeout(function() {
        form.submit();
         },250);
}