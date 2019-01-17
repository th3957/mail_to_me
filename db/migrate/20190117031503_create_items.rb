class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, limit: 255, null: false
      t.string :group, limit: 255
      t.references :list, foreign_key: true, null: false
    end
  end
end
