class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :descriptor
      t.belongs_to :brand, null: false, foreign_key: { on_delete: :cascade }
      t.timestamps
      t.index [:name, :descriptor], unique: true
    end

    create_table :products_sizes do |t|
      t.belongs_to :product, null: false, foreign_key: { on_delete: :cascade }
      t.belongs_to :size, null: false, foreign_key: { on_delete: :cascade }
      t.timestamps
      t.index [:product_id, :size_id], unique: true
    end
  end
end
