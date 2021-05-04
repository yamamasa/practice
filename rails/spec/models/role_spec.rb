require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:role) { create :role }

  describe 'FactoryBot は' do
    it 'データ登録ができる' do
      expect(role.id).to be_present
    end
  end
end
