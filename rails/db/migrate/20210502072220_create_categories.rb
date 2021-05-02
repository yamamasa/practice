class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.bigint :parent_id, null: true
      t.integer :lft, null: false
      t.integer :rgt, null: false
      t.string :code, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
