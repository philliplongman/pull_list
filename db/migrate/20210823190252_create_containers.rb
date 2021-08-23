class CreateContainers < ActiveRecord::Migration[6.1]
  def change
    create_table :containers do |t|
      t.belongs_to :product, null: false, foreign_key: { on_delete: :cascade }
      t.belongs_to :size, null: false, foreign_key: { on_delete: :cascade }
      t.timestamps
      t.index [:product_id, :size_id], unique: true
    end
  end
end
