class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :title, limit: 255, null: false
      t.references :user, foreign_key: true, null: false
      t.references :travel, foreign_key: true
    end
  end
end
