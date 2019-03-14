class RemoveColumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :identification, :boolean, null: false, default: false
    remove_column :users, :suspension, :boolean, null: false, default: false
  end
end
