class Account < ApplicationRecord
  has_many :account_roles, dependent: :restrict_with_exception

  validates :sub, presence: true, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true

  def self.fetch_by_jwt(jwt)
    account = Account.find_or_initialize_by(sub: jwt['sub'])

    account.name ||= jwt['name'] # Nameは初回のみ上書き
    account.email = jwt['email']
    account.picture_url = jwt['picture']
    account.save!

    account
  end
end
