class ChangeColumnToTravels < ActiveRecord::Migration[5.2]
  def up
    change_column :travels, :departed_at, :date, null: false
    change_column :travels, :returend_at, :date, null: false
  end
  def down
    change_column :travels, :departed_at, :datetime, null: false
    change_column :travels, :returend_at, :datetime, null: false
  end
end
