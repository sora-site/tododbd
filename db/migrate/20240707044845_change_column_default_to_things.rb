class ChangeColumnDefaultToThings < ActiveRecord::Migration[7.0]
  def change
    change_column_null :things, :persom_name, true
    change_column_null :things, :memo, true
    change_column_default :things, :persom_name, from: nil, to: 3
  end
end
