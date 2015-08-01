class Api::LibrariesController < ApplicationController

  def index
    @items = Item.all.order(:created_at)
    render :library
  end

  def show
    user = User.find(params[:user_id])
    @items = user.active_purchases
    render :library
  end
end
