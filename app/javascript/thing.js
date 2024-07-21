function post (){
  var convertToHHmm = function(date) {
    var date = new Date(date);
    // プライベートメソッドの処理
    var hours = date.getHours(); // 時間を取得
    var minutes = date.getMinutes(); // 分を取得

    // 1桁の場合は0でパディング
    if(hours < 10) {
      hours = '0' + hours;
    }
    if(minutes < 10) {
      minutes = '0' + minutes;
    }

    var time = hours + ':' + minutes; // hh:mm 形式に整形
    return time
  }
  //button要素をidで取得
  const buttons = document.querySelectorAll(".btn")
  //buttonをクリックした際イベント発火
  // 各ボタンに対してイベントリスナーを設定
buttons.forEach(function(button) {
  button.addEventListener('click', function() {
     // Id
     var thingId = $(this).data('id');
     // Name
     var thingName = $(this).data('name');
     // StartTime
     var startTime = convertToHHmm($(this).data('start'));
     // EndTime
     var endTime = convertToHHmm($(this).data('end'));
     // Memo
     var memo = $(this).data('memo');
     // Status
     var status = $(this).data('status');
    $.ajax({
      type: 'GET', 
      url: '/things/' + thingId+ '/edit', 
      // dataType: 'html',
      // async: true,
      data: { id : thingId },
      success: function() {
        // Successの処理(モーダル画面のvalueに値を挿入)
        $('#thing_name').val(thingName);
        $('#start_time').val(startTime);
        $('#end_time').val(endTime);
        $('#memo').val(memo);
        $('#status').val(status);
      },
      error: function(xhr, status, error) { 
        // Errorの処理

      }
    });
  });
});
};
 
window.addEventListener('turbo:load', post);