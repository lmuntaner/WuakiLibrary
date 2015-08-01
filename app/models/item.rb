class Item < ActiveRecord::Base
  has_many :episodes
  has_many :purchase_options
  has_many :purchases, through: :purchase_options
end
