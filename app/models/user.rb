class User < ActiveRecord::Base
  has_secure_password
  validates :username, :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  has_many :purchases
  has_many :purchase_options, through: :purchases

  def active_purchases
    purchases
      .where(
        'created_at >= :two_days_ago',
        two_days_ago: Time.now - 2.days)
      .order('created_at ASC')
      .map(&:item)
  end
end
