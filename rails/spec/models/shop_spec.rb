require 'rails_helper'

RSpec.describe Shop, type: :model do
  let(:shop) { create :shop }

  describe 'FactoryBot は' do
    it 'データ登録ができる' do
      expect(shop.id).to be_present
    end
  end
end
