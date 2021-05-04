FactoryBot.define do
  factory :role do
    sequence(:code) { |n| FFaker::Lorem.word + n.to_s }
    name { "#{FFaker::LoremJA.word}権限" }
    description { FFaker::LoremJA.sentence }
  end
end
