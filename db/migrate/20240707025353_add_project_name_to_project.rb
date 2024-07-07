class AddProjectNameToProject < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :project_name, :string, null: false
  end
end
