class ChangeColumnDefaultToThings2 < ActiveRecord::Migration[7.0]
  def change
    change_column_default :things, :persom_name, from: 3, to: nil
    change_column_default :things, :status_id, from: nil, to: 3
  end
end
