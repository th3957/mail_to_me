class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :content, limit: 255, null: false
      t.string :image, limit: 255
      t.boolean :importance, default: false, null: false
      t.references :travel, foreign_key: true, null: false
      t.timestamps
    end
  end
end
