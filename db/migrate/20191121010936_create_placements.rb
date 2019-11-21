class CreatePlacements < ActiveRecord::Migration[6.0]
  def change
    create_table :placements do |t|
      t.integer :shelf_capacity
      t.belongs_to :section, null: false, foreign_key: { on_delete: :cascade }
      t.belongs_to :product, null: false, foreign_key: { on_delete: :cascade }
      t.belongs_to :size, null: false, foreign_key: { on_delete: :cascade }
      t.timestamps
      t.index [:section_id, :product_id, :size_id], unique: true
    end
  end
end
