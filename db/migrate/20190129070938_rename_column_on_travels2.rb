class RenameColumnOnTravels2 < ActiveRecord::Migration[5.2]
  def change
    rename_column :travels, :returend_at, :returned_at
  end
end
