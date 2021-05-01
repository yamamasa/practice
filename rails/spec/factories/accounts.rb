FactoryBot.define do
  factory :account do
    sequence(:sub) { |n| 'auth0:%10d' % n }
    name { FFaker::Internet.user_name }
    email { FFaker::Internet.safe_email }
    picture_url { FFaker::Image.url }
  end
end
