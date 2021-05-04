require 'rails_helper'

RSpec.describe AccountRole, type: :model do
  let(:account_role) { create :account_role }

  describe 'FactoryBot は' do
    it 'データ登録ができる' do
      expect(account_role.id).to be_present
    end
  end
end
