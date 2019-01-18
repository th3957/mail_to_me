class RenameFromGroupToRemarkOnItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :group, :remark
  end
end
