function update (){
  //button要素をidで取得
  const button = document.getElementById("thingedit");
  if (!button){ return false;}
  button.addEventListener('click', (e) => {
    e.preventDefault();
    // Id
    const taskId = document.getElementById('task_id').value;
    const thingId = document.getElementById('thing_id').value;
    const thingName = document.getElementById('thing_name').value;
    const startTime = document.getElementById('start_time').value;
    const endTime = document.getElementById('end_time').value;
    const memo = document.getElementById('memo').value;
    const status = document.getElementById('status').value;
    $.ajax({
      type: 'PATCH', 
      url: '/things/' + thingId, 
      data: {
        thing:{
        id: thingId,
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
    }).done(function(data) {
      alert('todo・ステータスを更新しました！');
    }).fail(function(err) {

      console.error('Error:', err);
      });
        // モーダルを閉じる
        $('#exampleModal').modal('hide');
        // リロード
        location.reload();
  });
};
 
window.addEventListener('turbo:load', update);