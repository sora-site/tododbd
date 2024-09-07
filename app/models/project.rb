class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_one :space, dependent: :destroy

  def start_time
    registered_date
  end

  # バリデーション
  with_options presence: true do
    validates :project_name, length: { maximum: 30 }
  end

  accepts_nested_attributes_for :tasks,
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes['task_name'].blank? }
end
