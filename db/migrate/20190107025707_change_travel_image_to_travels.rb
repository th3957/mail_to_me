class ChangeTravelImageToTravels < ActiveRecord::Migration[5.2]
  def up
    change_column :travels, :travel_image, :string, limit: 255, default: "", null: false
  end
  def down
    change_column :travels, :travel_image, :string, limit: 255, null: false
  end
end
