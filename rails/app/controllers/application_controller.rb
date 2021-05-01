require 'token_auth'
class ApplicationController < ActionController::API
  before_action :token_auth

  def token_auth
    TokenAuth.veryfy(request.headers)
    pp TokenAuth.current_account(request.headers)
  end
end
