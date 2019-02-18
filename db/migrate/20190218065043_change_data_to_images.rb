class ChangeDataToImages < ActiveRecord::Migration[5.2]
  def up
    change_column :images, :data, :string, limit: 255, null: true, default: ""
  end
  def down
    change_column :images, :data, :string, limit: 255, null: false
  end
end
