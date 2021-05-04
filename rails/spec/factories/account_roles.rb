FactoryBot.define do
  factory :account_role do
    account { create :account }
    shop { create :shop }
    role { create :role }
  end
end
