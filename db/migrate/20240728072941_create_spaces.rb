class CreateSpaces < ActiveRecord::Migration[7.0]
  def change
    create_table :spaces do |t|
      t.string :space_name, null: false
      t.integer :orner_id, null: false
      t.timestamps
    end
  end
end
