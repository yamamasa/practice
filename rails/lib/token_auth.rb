# frozen_string_literal: true

require 'auth0'
require 'jwt'
class TokenAuth
  class TokenInvalid < StandardError; end

  def self.parse(headers)
    raise TokenInvalid, 'Authorization is blank' if headers['Authorization'].blank?

    type, token = headers['Authorization'].split

    raise TokenInvalid, format('Authorization type invalid : %s', type) if type != 'Bearer'
    raise TokenInvalid, 'Authorization token format invalid' if token.blank?

    token
  end

  def self.veryfy(headers)
    auth0_client.validate_id_token parse(headers), audience: ENV['AUTH0_FRONTEND_CLIENT_ID']
  end

  def self.current_account(headers)
    decoded = JWT.decode parse(headers), nil, false
  end

  def self.auth0_client
    @auth0_client ||= Auth0Client.new(
      client_id: ENV['AUTH0_CLIENT_ID'],
      client_secret: ENV['AUTH0_CLIENT_SECRET'],
      domain: ENV['AUTH0_DOMAIN']
    )
  end
end
