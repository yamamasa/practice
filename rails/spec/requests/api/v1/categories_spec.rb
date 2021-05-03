require 'rails_helper'

RSpec.describe 'Api::V1::Categories', type: :request do
  let!(:categories) { create_list :category, 2, :has_parent }

  context '未ログイン' do
    describe 'GET /' do
      it '認証エラー' do
        get api_v1_categories_path
        expect(response).to have_http_status(:unauthorized)
      end
    end

    describe 'GET /:id' do
      it '認証エラー' do
        get api_v1_category_path(categories.first)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  context 'ログインしているとき' do
    include_context 'ログイン済'
    describe 'GET /' do
      it '成功' do
        get api_v1_categories_path
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET /:id' do
      it '成功' do
        get api_v1_category_path(categories.first)
        expect(response).to have_http_status(:success)
      end
    end
  end
end
