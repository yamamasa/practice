class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.bigint :parent_id, null: true
      t.integer :lft, null: false, index: true, default: 0
      t.integer :rgt, null: false, index: true, default: 0

      t.string :code, null: false
      t.string :name, null: false

      t.integer :depth, null: false, default: 0, index: true

      t.timestamps
    end
    add_index :shops, :code, unique: true
  end
end
