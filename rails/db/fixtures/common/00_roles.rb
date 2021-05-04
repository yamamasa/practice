# rubocop:disable Lint/UselessAssignment
YAML.load_file('./db/fixtures/common/yml/00_roles.yml').each do |row|
  saved = Role.seed(:code) do |s|
    s.code = row['code']
    s.name = row['name']
    s.description = row['description']
  end
end
# rubocop:enable Lint/UselessAssignment
