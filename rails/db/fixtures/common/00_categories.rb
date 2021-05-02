# yamlを使ったマスターデータの作成をしてみた
def save (row, parent = nil)
  prev ||= nil

  saved = Category.seed(:code) do |s|
    s.parent_id = parent.id if parent.present?
    s.code = row['code']
    s.name = row['name']
  end

  # 並び替え
  saved.move_to_right_of(prev) if prev.present?

  # 子要素の登録
  if row['children'].present?
    row['children'].each do |c|
      save(c, saved.first)
    end
  end
  prev = saved.first
end

YAML.load_file('./db/fixtures/common/yml/00_categories.yml').each do | row |
  save(row)
end
