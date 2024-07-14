class ChangeColumnDefaultToThings3 < ActiveRecord::Migration[7.0]
  def change
    change_column_default :things, :status_id, from: 3, to: 4
  end
end
