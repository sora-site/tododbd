function post (){
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
     var startTime = $(this).data('start');
     // EndTime
     var endTime = $(this).data('end');
     // Memo
     var memo = $(this).data('memo');
     // Status
     var status = $(this).data('status');
    //  console.log(thingId);
    //  console.log(thingName);
    //  console.log(startTime);
    //  console.log(endTime);
    //  console.log(memo);
    //  console.log(status);
    $.ajax({
      type: 'GET', 
      url: '/thing/${thingId}/my_action', 
      data: { id : thingId }, 
      success: function(response) {
        // Successの処理
      },
      error: function(xhr, status, error) { 
        // Errorの処理
      }
    });
  });
});
};
 
window.addEventListener('turbo:load', post);