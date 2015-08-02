class SitesController < ApplicationController

  def home
    @new_user = User.new
    @items = Item.all.order(:created_at).includes(:episodes)
    @user_items = current_user.active_purchases
  end
end
