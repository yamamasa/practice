class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.bigint :parent_id, null: true
      t.integer :lft, null: false, index: true
      t.integer :rgt, null: false, index: true
      t.integer :depth, null: false, default: 0, index: true
      t.string :code, null: false
      t.string :name, null: false

      t.timestamps
    end
    add_index :categories, :code, unique: true
  end
end
