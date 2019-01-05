class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string, limit: 255, null: false
    add_column :users, :role, :integer, default: 0, null: false
    add_column :users, :identification, :boolean, default: false, null: false
    add_column :users, :suspension, :boolean, default: false, null: false
  end
end
