class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.date       :registered_date,           null: false
      t.references :user,                      null: false, foreign_key: true
      t.timestamps
    end
  end
end
