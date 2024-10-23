$(function(){
  $('#searchResult').on('click','.check', function() {
    if ($(this).prop('checked')){
      // 一旦全てをクリアして再チェックする
      $('.check').prop('checked', false);
      $(this).prop('checked', true);
    }
  });
});

function chebg(chkID){//タグの背景色変更
    Myid=document.getElementById(chkID);
    if(Myid.checked == true){
        Myid.parentNode.style.backgroundColor = '#CC28A8';
        Myid.parentNode.style.color = '#FFFFFF';
    }else{
        Myid.parentNode.style.backgroundColor = '#FFFFFF';//背景色
        Myid.parentNode.style.color = '#333333';//文字色
    }
}