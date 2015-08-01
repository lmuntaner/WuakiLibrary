class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :purchase_option
  delegate :item, to: :purchase_option, allow_nil: true
  validate :already_purchased_and_active

  def already_purchased_and_active
    item_id = purchase_option.item_id
    alreadly_purchased_and_active_items = Purchase
      .joins(:purchase_option)
      .where(
        'purchase_options.item_id = :item_id AND
        purchases.created_at >= :two_days_ago',
        two_days_ago: Time.now - 2.days,
        item_id: item_id
      )
     unless alreadly_purchased_and_active_items.size == 0
       errors.add(:item, "already purchased")
     end
  end
end
