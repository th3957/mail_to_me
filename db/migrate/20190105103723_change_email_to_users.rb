class ChangeEmailToUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :email, :string, default: "", limit: 255, null: false
  end
  def down
    change_column :users, :email, :string, default: "", null: false
  end
end
