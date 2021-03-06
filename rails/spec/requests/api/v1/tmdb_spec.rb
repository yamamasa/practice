require 'rails_helper'

RSpec.describe 'Api::V1::Tmdbs', type: :request do
  # TMDbへのアクセスをモックにする
  before do
    allow(Tmdb::Movie).to receive(:find).and_return([])
    allow(Tmdb::TV).to receive(:find).and_return([])
  end

  context '未ログイン' do
    describe 'GET /search' do
      it '認証エラー' do
        get search_api_v1_tmdb_path
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  context 'ログインしているとき' do
    include_context 'ログイン済'
    describe 'GET /' do
      it '成功' do
        get search_api_v1_tmdb_path(params: { keyword: FFaker::LoremJA.word })
        expect(response).to have_http_status(:success)
      end
    end
  end
end
