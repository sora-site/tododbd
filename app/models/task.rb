class Task < ApplicationRecord
  belongs_to :project
  has_many :things, dependent: :destroy

  # バリデーション
  with_options presence: true do
    validates :task_name, length: { maximum: 20 }
    validates :things
  end

  accepts_nested_attributes_for :things,
                                allow_destroy: true,
                                reject_if: proc { |attributes|
                                             attributes['thing_name'].blank? and attributes['person_name'].blank? and
                                               attributes['start_time'].blank? and attributes['end_time'].blank?
                                           }
end
