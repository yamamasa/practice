FactoryBot.define do
  factory :role do
    sequence(:code) { |n| FFaker::Lorem.word + n.to_s }
    name { "#{FFaker::LoremJA.word}権限" }
    description { FFaker::LoremJA.sentence }

    # ユニーク制約があるテーブルではfind_or_create_byを設定しておく
    initialize_with { Role.find_or_create_by(code: code) }
  end

  # 本来シードで用意されるものをtraitで作っておくとテストを書くときに便利
  trait :admin do
    code { :admin }
    name { 'システム管理者' }
  end

  trait :manager do
    code { :manager }
    name { '店舗管理者' }
  end

  trait :operator do
    code { :operator }
    name { '店舗スタッフ' }
  end
end
