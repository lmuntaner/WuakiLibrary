class Api::ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @purchase_options = @item.purchase_options
    render :show
  end
end
