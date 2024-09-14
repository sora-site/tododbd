class AddProjectIdToSpaces < ActiveRecord::Migration[7.0]
  def change
    add_reference :spaces, :project, foreign_key: true
  end
end
