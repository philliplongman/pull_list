class CreateSizes < ActiveRecord::Migration[6.0]
  def change
    create_table :sizes do |t|
      t.string :description, null: false, index: { unique: true }
      t.integer :average_shelf_capacity
      t.timestamps
    end
  end
end
