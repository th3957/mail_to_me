class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :data, limit: 255, null: false
      t.references :card, foreign_key: true, null: false
    end
  end
end
