class Api::SeasonsController < ApplicationController

  def index
    @seasons = Item.where(category: 'Season').order(:created_at)
    render :index
  end
end
