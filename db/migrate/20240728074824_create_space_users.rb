class CreateSpaceUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :space_users do |t|
      t.references :space, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
