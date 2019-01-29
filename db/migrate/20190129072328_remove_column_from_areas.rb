class RemoveColumnFromAreas < ActiveRecord::Migration[5.2]
  def change
    remove_column :areas, :created_at, :datetime, null: false
    remove_column :areas, :updated_at, :datetime, null: false
  end
end
