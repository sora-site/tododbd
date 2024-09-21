class AddOrnerIdToSpaces < ActiveRecord::Migration[7.0]
  def change
    add_column :spaces, :orner_name, :string
  end
end
