class Api::V1Controller < ApplicationController
  # このAPIは認証不要
  skip_before_action :token_auth!

  def index; end
end
