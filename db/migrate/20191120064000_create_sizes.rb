class CreateSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :sizes do |t|
      t.string :description, null: false, index: { unique: true }
      t.timestamps
    end

    create_table :sections_sizes do |t|
      t.belongs_to :section, null: false, foreign_key: { on_delete: :cascade }
      t.belongs_to :size, null: false, foreign_key: { on_delete: :cascade }
      t.index [:section_id, :size_id], unique: true
    end
  end
end
