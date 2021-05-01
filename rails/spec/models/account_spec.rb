require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) { create :account }

  describe 'FactoryBot は' do
    it 'データ登録ができる' do
      expect(account.id).to be_present
    end
  end

  describe 'self.fetch_by_jwtは' do
    # buildを使うことによって、DBには登録しないが、各項目は生成される
    # それをうまく使ってテスト用のJWTを作る
    let(:account) { build :account }
    let(:jwt_sub) { account.sub } # この値で挙動が変わるので外に出しておく
    let(:jwt) do
      { name: account.name,
        picture: account.picture_url,
        email: account.email,
        sub: jwt_sub }.stringify_keys
    end
    let!(:fetch) { described_class.fetch_by_jwt(jwt) }

    describe 'アカウント情報が正しく登録される' do
      it 'DBに正しく登録されている' do
        expect(fetch).to be_present
        expect(fetch.id).to be_present
        expect(fetch.name).to eq account.name
        expect(fetch.picture_url).to eq account.picture_url
        expect(fetch.email).to eq account.email
        expect(fetch.sub).to eq account.sub
      end

      context 'すでにDBに登録がある場合' do
        # 前述でsubを変数化したことにより、何がトリガーでこの条件が起きるのか見通しが良くなる。
        let!(:exists) { create :account } # 登録済みアカウントを作る
        let!(:jwt_sub) { exists.sub } # 既に登録されているSubに変える

        it '登録済みのAccount情報が返る' do
          expect(fetch.id).to eq exists.id
        end

        it 'nameとsubは変更されない' do
          expect(fetch.sub).to eq exists.sub
          expect(fetch.name).to eq exists.name
        end

        it 'その他の項目は更新されている' do
          # 「画像URLとemailは変更される」とも書けなくはないが、
          # 仕様をより正しく表現するには「その他の項目」といったほうが適切
          expect(fetch.picture_url).to eq account.picture_url
          expect(fetch.email).to eq account.email
        end
      end
    end
  end
end
