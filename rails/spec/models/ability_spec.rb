require 'rails_helper'

RSpec.describe Ability, type: :model do
  subject { described_class.new(account) }

  # 状態をいろいろ変更するために、依存関係を外だししておく
  let!(:account) { create :account }
  let!(:shop) { create :shop }
  let!(:role) { create :role }
  let!(:account_role) do
    create :account_role,
           account: account,
           shop: shop,
           role: role
  end

  shared_examples_for '権限の継承' do |method|
    it "#{method}をコールする" do
      # インスタンスクラスのモック
      # rubocop:disable RSpec/AnyInstance)
      allow_any_instance_of(described_class).to receive(method).and_return(nil)
      # rubocop:enable RSpec/AnyInstance)
      expect(described_class.new(account)).to have_received(method).once
    end
  end

  shared_examples_for '権限チェック' do |actions|
    actions.each do |action, result|
      result_txt = (result ? 'できる' : 'できない')
      it "#{action} が#{result_txt}" do
        expect(subject.can?(action, resource)).to eq result
      end
    end
  end

  shared_examples_for '全不可' do
    it_behaves_like '権限チェック', {
      read: false, index: false, show: false,
      save: false, create: false, update: false, destroy: false
    }
  end

  shared_examples_for '参照のみ可' do
    it_behaves_like '権限チェック', {
      read: true, index: true, show: true,
      save: false, create: false, update: false, destroy: false
    }
  end

  describe 'システム管理者は' do
    let(:role) { create :role, :admin }

    it_behaves_like '権限の継承', :all_ability
    describe 'Category は' do
      let(:resource) { Category }

      it_behaves_like '参照のみ可', Category
    end

    describe 'Account は' do
      context '自身のデータは' do
        let(:resource) { account }

        it_behaves_like '参照のみ可'
      end

      context '他人のデータは' do
        let(:resource) { create :account }

        it_behaves_like '全不可'
      end
    end
  end

  describe '店舗管理者は' do
    let(:role) { create :role, :manager }

    it_behaves_like '権限の継承', :operator_ability
  end

  describe '店舗スタッフは' do
    let(:role) { create :role, :operator }

    it_behaves_like '権限の継承', :all_ability
  end
end
