json.array! @items do |item|
  if (item.category == 'Movie')
    json.extract!(item, :id, :title, :plot, :category, :created_at, :updated_at)
  else
    json.extract!(item, :id, :title, :category, :created_at, :updated_at)
    json.episodes item.episodes.order(:order) do |episode|
      json.extract!(episode, :id, :title, :plot, :created_at, :updated_at)
    end
  end
end
