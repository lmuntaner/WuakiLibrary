json.array! @movies do |movie|
  json.extract!(movie, :id, :title, :plot, :category, :created_at, :updated_at)
end
