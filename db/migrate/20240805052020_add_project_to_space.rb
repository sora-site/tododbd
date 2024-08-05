class AddProjectToSpace < ActiveRecord::Migration[7.0]
  def change
    add_reference :spaces, :project, null: false, foreign_key: true, unique: true
  end
end
