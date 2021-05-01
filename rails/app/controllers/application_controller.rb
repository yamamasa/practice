class ApplicationController < ActionController::API
  before_action :token_auth

  def token_auth
    pp request.headers['Authorization']
  end
end
