function post (){
  //button要素をidで取得
  const button = document.getElementById("thingcreate");
  if (!button){ return false;}
  button.addEventListener('click', (e) => {
    e.preventDefault();
    // Id
    const taskId = document.getElementById('task_id').value;
    // const thingId = document.getElementById('thing_id').value;
    const thingName = document.getElementById('new_thing_name').value;
    const startTime = document.getElementById('new_start_time').value;
    const endTime = document.getElementById('new_end_time').value;
    const memo = document.getElementById('new_memo').value;
    const status = '4';
    debugger
    $.ajax({
      type: 'POST', 
      url: '/things', 
      data: {
        thing:{
        thing_name: thingName,
        start_time: startTime,
        end_time: endTime,
        memo: memo ,
        status_id: status,
        task_id:taskId
       } 
      },
      headers: {
        'X-CSRF-Token' : $('meta[name="csrf-token"]').attr('content')
      }
    }).done(function() {
      // alert('todoを追加しました！');
    }).fail(function(err) {
      alert('todoの追加に失敗しました。管理者に問い合わせてください');
      });
        // モーダルを閉じる
        $('#exampleModal').modal('hide');
        // リロード
        location.reload();
  });
};
 
window.addEventListener('turbo:load', post);