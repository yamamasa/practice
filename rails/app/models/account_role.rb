class AccountRole < ApplicationRecord
  belongs_to :account
  belongs_to :shop
  belongs_to :role
end
