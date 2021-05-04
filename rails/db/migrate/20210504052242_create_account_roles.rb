class CreateAccountRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :account_roles do |t|
      t.references :account, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true
      t.timestamps
    end
    # referencesの定義のカラムはxxxx_idになるのでそれを指定してIndexを作る
    add_index :account_roles, %i[account_id shop_id role_id], unique: true
  end
end
