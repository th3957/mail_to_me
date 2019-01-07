class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :country, limit: 255, null: false
      t.string :place, limit: 255, null: false
      t.references :travel, foreign_key: true, null: false
      t.timestamps
    end
  end
end
