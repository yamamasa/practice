# 環境変数で ADMIN_EMAIL,ADMIN_NAME,ADMIN_SUBを設定するとシステム管理者としてアカウントを作成

if ENV['ADMIN_EMAIL'].blank?
  # rubocop:disable Rails/Output
  puts '[INFO] .env ADMIN_EMAIl is blank. not create account'
  # rubocop:enable Rails/Output
else
  saved = Account.seed(:sub) do |s|
    s.name = ENV['ADMIN_NAME']
    s.sub = ENV['ADMIN_SUB']
    s.email = ENV['ADMIN_EMAIL']
  end

  account = saved.first
  role = Role.find_by(code: :admin)
  Shop.roots.each do |shop|
    AccountRole.seed_once(:account_id, :shop_id, :role_id) do |s|
      # idで渡さないと重複チェックが効かない
      s.account_id = account.id
      s.shop_id = shop.id
      s.role_id = role.id
    end
  end
end
