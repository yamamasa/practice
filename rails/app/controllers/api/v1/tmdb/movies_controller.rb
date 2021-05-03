class Api::V1::Tmdb::MoviesController < ApplicationController
  def show
    # 映画の検索
    cache_key = 'api/v1/tmdb/movie#show-%s' % [params[:id]]
    @movie = Rails.cache.fetch(cache_key, expires_in: 1.hour) do
      Tmdb::Movie.detail(params[:id], language: :ja).symbolize_keys
    end
    reise ActiveRecord::RecordNotFound if @movie.blank?
  end
end
