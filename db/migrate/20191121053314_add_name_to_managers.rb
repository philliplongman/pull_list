class AddNameToManagers < ActiveRecord::Migration[6.0]
  def change
    add_column :managers, :name, :string, null: false, index: true
  end
end
