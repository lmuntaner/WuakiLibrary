json.seasons @seasons do |season|
  json.extract!(season, :id, :title, :created_at, :updated_at)
  json.episodes season.episodes.order(:order) do |episode|
    json.extract!(episode, :id, :title, :plot, :created_at, :updated_at)
  end
end
