class CreatePlacements < ActiveRecord::Migration[6.1]
  def change
    create_table :placements do |t|
      t.belongs_to :area,      null: false, foreign_key: { on_delete: :cascade }
      t.belongs_to :container, null: false, foreign_key: { on_delete: :cascade }
      t.integer :shelf_capacity
      t.timestamps
      t.index [:area_id, :container_id], unique: true
    end
  end
end
