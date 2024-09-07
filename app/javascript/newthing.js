function get() {
  var convertToHHmm = function (date) {
    var date = new Date(date);
    var hours = date.getHours(); // 時間を取得
    var minutes = date.getMinutes(); // 分を取得

    // 1桁の場合は0でパディング
    if (hours < 10) {
      hours = '0' + hours;
    }
    if (minutes < 10) {
      minutes = '0' + minutes;
    }

    // hh:mm 形式に整形
    var time = hours + ':' + minutes;
    return time
  }
  //button要素をidで取得
  const buttons = document.querySelectorAll(".btn.btn-primary.new");
  if (!buttons) { return false; }

  // buttonをクリックした際イベント発火
  // 各ボタンに対してイベントリスナーを設定
  buttons.forEach(function (button) {
    button.addEventListener('click', function () {
      // taskId
      var taskId = $(this).data('task-id');
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
        url: '/things/new',
        // dataType: 'html',
        // async: true,
        // data: { id : thingId },
        success: function () {
          $('#task_id').val(taskId);
          $('#thing_id').val(thingId);
          $('#thing_name').val(thingName);
          $('#start_time').val(startTime);
          $('#end_time').val(endTime);
          $('#memo').val(memo);
          $('#status').val(status);
        },
        error: function (xhr, status, error) {
          // Errorの処理
          alert('エラーが発生しました。管理者に問い合わせてください');
        }
      });
    });
  });
};

window.addEventListener('turbo:load', get);
window.addEventListener("turbo:render", get)