# yamlを使ったマスターデータの作成をしてみた
def save(row, prev = nil, parent = nil)
  saved = Shop.seed(:code) do |s|
    s.parent_id = parent.id if parent.present?
    s.code = row['code']
    s.name = row['name']
  end

  # 並び替え
  saved.first.move_to_right_of(prev) if prev.present?

  # 子要素の登録
  if row['children'].present?
    prev = nil
    row['children'].each do |c|
      prev = save(c, prev, saved.first)
    end
  end
  saved.first
end

# rubocop:disable Lint/UselessAssignment
YAML.load_file('./db/fixtures/common/yml/00_shops.yml').each do |row|
  prev = save(row, prev)
end
# rubocop:enable Lint/UselessAssignment
