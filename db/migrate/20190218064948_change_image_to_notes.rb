class ChangeImageToNotes < ActiveRecord::Migration[5.2]
  def up
    change_column :notes, :image, :string, limit: 255, default: ""
  end
  def down
    change_column :notes, :image, :string, limit: 255
  end
end
