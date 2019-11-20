class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string :name, null: false, index: { unique: true }
      t.belongs_to :area, null: false, foreign_key: true
      t.string :timestamps
    end
  end
end
