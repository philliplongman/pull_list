class DeviseCreateManagers < ActiveRecord::Migration[6.1]
  def change
    create_table :managers do |t|
      t.string :name

      ## Database authenticatable
      t.string :email,              null: false, index: { unique: true }
      t.string :encrypted_password, null: false, index: { unique: true }

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end
  end
end
