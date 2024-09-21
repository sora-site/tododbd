class AddOrnerToSpaces < ActiveRecord::Migration[7.0]
  def change
    add_column :spaces, :orner_id, :integer
  end
end
