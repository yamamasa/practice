require 'rails_helper'

RSpec.describe 'Api::V1::Tmdb::Movies', type: :request do
  # TMDbへのアクセスをモックにする
  before do
    allow(Tmdb::Movie).to receive(:detail).and_return(
      {
        id: 0,
        title: FFaker::Movie.title,
        poster_path: '/path/to/poster'
      }
    )
  end

  context '未ログイン' do
    describe 'GET /:id' do
      it '認証エラー' do
        get api_v1_tmdb_movie_path({ id: 'xxxx' })
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  context 'ログインしているとき' do
    include_context 'ログイン済'
    describe 'GET /:id' do
      it '成功' do
        get api_v1_tmdb_movie_path({ id: 'xxxx' })
        expect(response).to have_http_status(:success)
      end
    end
  end
end
