class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :title, limit: 255, null: false
      t.string :sentence, limit: 255, null: false
      t.integer :frame_style, null: false
      t.integer :font_style, null: false
      t.references :travel, foreign_key: true, null: false
      t.timestamps
    end
  end
end
