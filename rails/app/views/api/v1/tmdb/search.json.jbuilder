json.status :tmdb

json.movies do
  json.array! @result[:movies] do |m|
    json.extract! m, :id, :title
    json.release_at m.release_date
    json.poster_url 'https://image.tmdb.org/t/p/original'+m.poster_path
    json.thumbnail_url 'https://image.tmdb.org/t/p/w200'+m.poster_path
  end
end
