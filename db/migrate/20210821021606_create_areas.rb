class CreateAreas < ActiveRecord::Migration[6.1]
  def change
    create_table :areas do |t|
      t.string :name, null: false, index: { unique: true }
      t.belongs_to :section, null: false, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
