slim ||= false # 表示項目を限定するオプションを用意しておく

json.extract! category, :id, :code, :name, :parent_id, :depth

json.has_parent !category.root? # 状態判定用の項目はAPIで作ってあげたほうが手軽

unless slim
  json.parent do
    json.partial! 'api/v1/categories/category', category: category.parent, slim: true if category.parent.present?
  end
end
