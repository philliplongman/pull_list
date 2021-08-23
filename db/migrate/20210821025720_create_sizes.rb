class CreateSizes < ActiveRecord::Migration[6.1]
  def change
    create_table :sizes do |t|
      t.string :description, null: false, index: { unique: true }
      t.timestamps
    end
  end
end
