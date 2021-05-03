# ログインしてない
shared_context '未ログイン' do
  let(:account) { nil }
end

# 一般アカウントのログイン
shared_context 'ログイン済' do
  let!(:account) { create :account }
  before do
    allow(TokenAuth).to receive(:current_account).and_return(account)
  end
end
