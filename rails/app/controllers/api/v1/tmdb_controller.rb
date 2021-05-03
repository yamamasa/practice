require 'digest/sha1'

class Api::V1::TmdbController < ApplicationController
  def search
    @keyword = params[:keyword]
    @result = { movies: [] }
    return if params[:keyword].blank?

    # 映画の検索
    cache_key = 'api/v1/tmdb-%s' % [Digest::SHA1.hexdigest(params[:keyword])]
    @result = Rails.cache.fetch(cache_key, expires_in: 1.hour) do
      {
        movies: Tmdb::Movie.find(params[:keyword]),
        tvs: Tmdb::TV.find(params[:keyword])
      }
    end
  end
end
