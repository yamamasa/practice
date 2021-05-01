# frozen_string_literal: true

require 'auth0'
require 'jwt'
class TokenAuth
  class TokenInvalid < StandardError; end

  # Tokenを返す
  def self.parse(headers)
    raise TokenInvalid, 'Authorization is blank' if headers['Authorization'].blank?

    type, token = headers['Authorization'].split

    raise TokenInvalid, 'Authorization type invalid : %s' % type if type != 'Bearer'
    raise TokenInvalid, 'Authorization token format invalid' if token.blank?

    auth0_client.validate_id_token token, audience: ENV['AUTH0_CLIENT_ID']

    token
  end

  # 現在のログインアカウントを返す(未ログインはnil)
  def self.current_account(headers)
    token = parse(headers)

    decoded = JWT.decode token, nil, false
    Account.fetch_by_jwt(decoded[0])
  rescue TokenAuth::TokenInvalid
    nil
  end

  # auth0の接続クライアントを返す
  def self.auth0_client
    @auth0_client ||= Auth0Client.new(
      client_id: ENV['AUTH0_M2M_CLIENT_ID'],
      client_secret: ENV['AUTH0_M2M_CLIENT_SECRET'],
      domain: ENV['AUTH0_DOMAIN']
    )
  end
end
