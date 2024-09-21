class ChangeColumnsAddNotnullOnSpaces < ActiveRecord::Migration[7.0]
  def change
    change_column_null :spaces, :orner_name, false
    change_column_null :spaces, :orner_id, false
  end
end
