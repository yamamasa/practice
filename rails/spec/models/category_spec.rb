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

  describe 'scope' do
    describe 'tree_id_eq は' do
      # 返りをテストするものをsubjectに入れると、 is_expected.toが使える
      subject { described_class.tree_id_eq(current.id) }

      let!(:current) { create :category, :has_parent }
      let!(:child) { create :category, parent: current }
      let!(:grandchild) { create :category, parent: child }

      it { is_expected.to_not include current }
      it { is_expected.to_not include current.parent }
      it { is_expected.to include child }
      it { is_expected.to include grandchild }
    end
  end
end
