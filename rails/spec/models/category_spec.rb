require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create :category }

  describe 'FactoryBot は' do
    it 'データ登録ができる' do
      expect(category.id).to be_present
    end
  end

  describe 'nested_setのメソッドが' do
    let!(:category) { create :category, :has_children }

    it '使用できる' do
      expect(category.children).to be_present
    end
  end
end
