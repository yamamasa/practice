require 'rails_helper'

RSpec.describe 'TOP', type: :request do
  describe 'GET /' do
    it '成功する' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end
end
