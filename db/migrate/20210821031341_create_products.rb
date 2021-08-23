class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.belongs_to :brand, null: false, foreign_key: { on_delete: :cascade }
      t.string :name, null: false
      t.string :variety
      t.timestamps
      t.index [:brand_id, :name, :variety], unique: true
    end
  end
end
