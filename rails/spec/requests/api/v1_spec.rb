require 'rails_helper'

RSpec.describe 'Api::V1', type: :request do
  describe 'GET /api/v1' do
    it '成功する' do
      get api_v1_path
      expect(response).to have_http_status(:success)
    end
  end
end
