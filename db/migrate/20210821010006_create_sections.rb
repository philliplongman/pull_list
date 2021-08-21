class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :name, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
