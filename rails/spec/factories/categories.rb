FactoryBot.define do
  factory :category do
    parent { nil }

    # 重複不可のところはシーケンスを使う。ただ数字だけだと判別しにくいのでFFakerも併用
    sequence(:code) { |n| '%s-%d' % [FFaker::Lorem.word, n] }

    # 重複していいならランダムで
    name { FFaker::LoremJA.word }

    # Traitを使うと、 create(:category, :has_parent)でtrait内に書いた状態を作れる
    # この場合は「親を持っている」
    trait :has_parent do
      parent { create :category }
    end

    trait :has_children do
      after(:create) do |parent|
        create_list :category, 2, parent: parent
      end
    end
  end
end
