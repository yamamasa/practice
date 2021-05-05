require 'token_auth'

class Unauthorized < StandardError; end

class ApplicationController < ActionController::API
  before_action :token_auth!
  rescue_from Unauthorized, with: :render_unauthorized
  rescue_from CanCan::AccessDenied, with: :render_forbidden

  def token_auth!
    raise Unauthorized if current_account.blank?
  end

  def current_account
    TokenAuth.current_account(request.headers)
  rescue TokenAuth::TokenInvalid
    nil
  end

  def current_ability
    @current_ability ||= Ability.new(current_account)
  end

  def render_forbidden(exception)
    render_error exception, 403
  end

  def render_unauthorized(exception)
    render_error exception, 401
  end

  def render_error(exception, status_code)
    @status_code = status_code
    @exception = exception
    render '/error', status: status_code
  end
end
