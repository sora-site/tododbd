function update() {
  var shape = function (memo) {
    if (memo == "") {
      memo = '-';
    }
    var string = memo;
    return string;
  }
  //button要素をidで取得
  const button = document.getElementById("thingedit");
  if (!button) { return false; }
  button.addEventListener('click', (e) => {
    e.preventDefault();
    // Id
    const thingId = document.getElementById('thing_id').value;
    const thingName = document.getElementById('thing_name').value;
    const startTime = document.getElementById('start_time').value;
    const endTime = document.getElementById('end_time').value;
    let memo = document.getElementById('memo').value;
    const status = document.getElementById('status').value;
    debugger
    $.ajax({
      type: 'PATCH',
      url: '/things/' + thingId,
      data: {
        thing: {
          thing_name: thingName,
          start_time: startTime,
          end_time: endTime,
          memo: shape(memo),
          status_id: status,
        }
      },
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      }
    }).done(function () {
      // alert('todo・ステータスを更新しました！');
    }).fail(function (err) {
      alert('todoの更新に失敗しました。メモ以外の項目を入力するか\nそれでも解決しない場合は、管理者に問い合わせてください。');
    });
    // モーダルを閉じる
    $('#exampleModal').modal('hide');
    // リロード
    location.reload();
  });
};

window.addEventListener('turbo:load', update);