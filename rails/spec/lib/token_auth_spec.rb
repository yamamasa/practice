require 'rails_helper'
require 'token_auth'

describe TokenAuth do
  before do
    allow(Auth0Client).to receive(:new).and_return(:hoge)
  end

  let(:authorization) { nil }
  let(:headers) { { 'Authorization' => authorization } }

  describe 'parseは' do
    context 'ヘッダーが空のとき' do
      let(:authorization) { nil }

      it 'エラーとなる' do
        expect { described_class.parse(headers) }.to raise_error(TokenAuth::TokenInvalid)
      end
    end

    context 'トークンタイプが違うとき' do
      let(:authorization) { 'Basic xxxxxx' }

      it 'エラーとなる' do
        expect { described_class.parse(headers) }.to raise_error(TokenAuth::TokenInvalid)
      end
    end

    context 'トークン書式が違うとき' do
      let(:authorization) { 'xxxxxx' }

      it 'エラーとなる' do
        expect { described_class.parse(headers) }.to raise_error(TokenAuth::TokenInvalid)
      end
    end
  end
end
