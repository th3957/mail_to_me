class RenameColumnOnTravels < ActiveRecord::Migration[5.2]
  def change
    rename_column :travels, :departured_at, :departed_at
  end
end
