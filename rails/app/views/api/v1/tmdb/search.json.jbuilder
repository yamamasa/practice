json.status :tmdb

json.movies do
  json.array! @result[:movies] do |m|
    # 詳細と検索でライブラリが返す形式が違うので統一のための苦肉の策
    json.partial! 'api/v1/tmdb/movies/movie', movie: JSON.parse(m.to_json, { symbolize_names: true }), slim: true
  end
end

json.tvs do
  json.array! @result[:tvs] do |m|
    json.extract! m, :id
    json.title m.name
    json.release_at m.first_air_date
    json.poster_url "https://image.tmdb.org/t/p/original#{m.poster_path}"
    json.thumbnail_url "https://image.tmdb.org/t/p/w200#{m.poster_path}"
  end
end
