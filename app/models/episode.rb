class Episode < ActiveRecord::Base
  belongs_to :season, class_name: 'Item', foreign_key: 'item_id'
end
