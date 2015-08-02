if @item.category == "Movie"
  json.extract!(@item, :id, :title, :plot, :category, :created_at, :updated_at)
else
  json.extract!(@item, :id, :title, :category, :created_at, :updated_at)
  json.episodes @item.episodes.order(:order) do |episode|
    json.extract!(episode, :id, :title, :plot, :order)
  end
end
json.purchase_options @purchase_options do |purchase_option|
  json.extract!(purchase_option, :id, :quality, :price)
end
