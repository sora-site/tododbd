class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  def start_time
    registered_date
  end

  accepts_nested_attributes_for :tasks,
                                allow_destroy: true,
                                reject_if: proc { |attributes| attributes['task_name'].blank? }
end
