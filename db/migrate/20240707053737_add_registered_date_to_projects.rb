class AddRegisteredDateToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :registered_date, :date, null: false
  end
end
