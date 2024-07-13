class ChangeColumnToThings < ActiveRecord::Migration[7.0]
  def change
    remove_column :things, :persom_name, :string
    add_column :things, :person_name, :string
  end
end
