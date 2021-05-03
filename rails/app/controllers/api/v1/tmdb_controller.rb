require 'digest/sha1'

class Api::V1::TmdbController < ApplicationController
  # skip_before_action :token_auth!

  def search
    @keyword = params[:keyword]
    @result = { movies:[] }
    if params[:keyword].present?
      # 映画の検索
      cache_key = 'api/v1/tmdb-%s' % [Digest::SHA1.hexdigest(params[:keyword])]
      @result = Rails.cache.fetch(cache_key, expires_in: 5.minutes) do
        {
          movies: TMDb::Movie.search(params[:keyword], language: :ja)
        }
      end

    end
  end
end
