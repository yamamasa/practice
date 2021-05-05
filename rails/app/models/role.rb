class Role < ApplicationRecord
  has_many :account_role, dependent: :restrict_with_exception
end
