class CreateThings < ActiveRecord::Migration[7.0]
  def change
    create_table :things do |t|
      t.string     :thing_name,               null: false
      t.string     :persom_name,              null: false
      t.time       :start_time,               null: false
      t.time       :end_time,                 null: false
      t.text       :memo,                     null: false
      t.integer    :status_id,                null: false
      t.references :task,                     null: false, foreign_key: true

      t.timestamps
    end
  end
end
