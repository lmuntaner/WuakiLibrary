json.purchase do
  json.title @purchase_option.item.title
  json.quality @purchase_option.quality
  json.price @purchase_option.price
  json.item_id @purchase_option.item.id
  json.user_id current_user.id
end
