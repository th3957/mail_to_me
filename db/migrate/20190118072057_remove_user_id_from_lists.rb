class RemoveUserIdFromLists < ActiveRecord::Migration[5.2]
  def change
    remove_column :lists, :user_id, :bigint, null: false
  end
end
