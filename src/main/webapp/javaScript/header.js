$(document).ready(function() {
    // ヘッダーアイコンのクリックイベント
    $('.headerIcon').on('click', function() {
        $('#customAlert').show();
    });

    // メニュー送信ボタンのクリックイベント
    $('#menuBtn').on('click', function() {
        audio('menuForm'); // メニュー画面へのフォームを送信し、音声を再生
    });

    // ログアウトボタンのクリックイベント
    $('#logoutBtn').on('click', function() {
        audio('logoutForm'); // ログアウトのフォームを送信し、音声を再生
    });

    // モーダル閉じるボタンのクリックイベント
    $('#closeModal').on('click', function() {
        var audioElement = document.getElementById('btnClick_audio');
        audioElement.currentTime = 0;
        audioElement.play(); // 音声を再生
        $('#customAlert').hide(); // モーダルを閉じる
    });

    // ドキュメント全体のクリックイベント
    $(document).on('click', function(event) {
        if (!$(event.target).closest('.menu-container').length) {
            $('.dropdown-menu').hide(); // メニュー外をクリックしたらドロップダウンを閉じる
        }
    });
});

// 音声再生とフォーム送信機能
function audio(formId) {
    let audioElement = document.getElementById('btnClick_audio');
    audioElement.currentTime = 0;
    audioElement.play();
    setTimeout(function() {
        document.getElementById(formId).submit(); // フォーム送信
    }, 250);
}
