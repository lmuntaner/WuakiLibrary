json.movies @movies do |movie|
  json.extract!(movie, :id, :title, :plot, :created_at, :updated_at)
end
