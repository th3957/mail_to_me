class ChangeTravelIdToLists < ActiveRecord::Migration[5.2]
  def up
    change_column :lists, :travel_id, :bigint, null: false
  end
  def down
    change_column :lists, :travel_id, :bigint
  end
end
