class Thing < ApplicationRecord
  belongs_to :task

  # バリデーション
  with_options presence: true do
    validates :thing_name, length: { maximum: 20 }
    validates :start_time
    validates :end_time
    validates :memo, length: { maximum: 50 }
    # Activehashバリデーション（ジャンルの選択が「---」(id = 1)の時は保存できないようにする／各項目想定したidより大きい時は保存できないようにする。）
  end
end
