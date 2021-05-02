class Category < ApplicationRecord
  acts_as_nested_set

  # スコープの説明: https://railsguides.jp/active_record_querying.html#%E3%82%B9%E3%82%B3%E3%83%BC%E3%83%97

  # あるカテゴリの配下にあるカテゴリを取得
  scope :tree_id_eq, ->(tree_id) { where(id: Category.find(tree_id).descendants.ids) }
end
