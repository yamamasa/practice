require 'token_auth'
class ApplicationController < ActionController::API
  before_action :token_auth!

  def token_auth!
    TokenAuth.parse(request.headers)
  end

  def current_account
    TokenAuth.current_account(request.headers)
  rescue TokenAuth::TokenInvalid
    nil
  end
end
