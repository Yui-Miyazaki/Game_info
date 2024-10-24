function audio(formId) {
    document.getElementById('btnClick_audio').currentTime = 0; 
    document.getElementById('btnClick_audio').play();
    setTimeout(function() {
                document.getElementById(formId).submit();
    },250);
}

