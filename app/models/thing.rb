class Thing < ApplicationRecord
  belongs_to :task

  # ActivehashModule
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Activehashアソシエーション
  belongs_to :status

  # バリデーション
  with_options presence: true do
    validates :thing_name, length: { maximum: 20 }
    validates :start_time
    validates :end_time
    # Activehashバリデーション（ジャンルの選択が「---」(id = 1)の時は保存できないようにする／各項目想定したidより大きい時は保存できないようにする。）
    validates :status_id, numericality: { other_than: 1, less_than: 7 }
  end

  validates :memo, length: { maximum: 50 }
end
