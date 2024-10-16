function audio() {
    document.getElementById('btnClick_audio').currentTime = 0; 
    document.getElementById('btnClick_audio').play();
    setTimeout(function() {
                document.getElementById("form").submit();
    },180);
}