slim ||= false

json.resource :movie
json.extract! movie, :id, :title
json.release_at movie[:release_date]
json.poster_url "https://image.tmdb.org/t/p/original#{movie[:poster_path]}"
json.thumbnail_url "https://image.tmdb.org/t/p/w200#{movie[:poster_path]}"
json.detail_url api_v1_tmdb_movie_url(movie[:id])
json.overview movie[:overview] unless slim
