class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :sub, null: false
      t.string :name, null: false
      t.string :email, length: 256, null: false
      t.string :picture_url, null: true

      t.timestamps
    end
    add_index :accounts, :sub, unique: true
  end
end
