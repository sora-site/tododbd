class RemoveRegisteredDateToProjects < ActiveRecord::Migration[7.0]
  def change
    remove_column :projects, :registered_date, :date
  end
end
