FactoryBot.define do
  factory :shop do
    sequence(:code) { |n| FFaker::Lorem.word + n.to_s }
    name { "#{FFaker::LoremJA.word}店" }

    trait :has_parent do
      parent { create :shop }
    end

    trait :has_children do
      after(:create) do |parent|
        create_list :shop, 2, parent: parent
      end
    end
  end
end
