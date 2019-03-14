class ChangeRemarkToItems < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :remark, :string, limit: 255, default: ""
  end
  def down
    change_column :items, :remark, :string, limit: 255
  end
end
