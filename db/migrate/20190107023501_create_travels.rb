class CreateTravels < ActiveRecord::Migration[5.2]
  def change
    create_table :travels do |t|
      t.string :title, limit: 255, null: false
      t.datetime :departured_at, null: false
      t.datetime :returend_at, null: false
      t.string :travel_image, limit: 255, null: false
      t.references :user, foreign_key: true, null: false
      t.timestamps null: false
    end
  end
end
