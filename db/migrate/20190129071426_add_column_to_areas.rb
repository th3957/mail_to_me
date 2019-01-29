class AddColumnToAreas < ActiveRecord::Migration[5.2]
  def change
    add_column :areas, :arrived_at, :date, null: false
    add_column :areas, :left_at, :date, null: false
  end
end
