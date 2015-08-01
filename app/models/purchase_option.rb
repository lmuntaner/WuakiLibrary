class PurchaseOption < ActiveRecord::Base
  belongs_to :item
  has_many :purchases
end
