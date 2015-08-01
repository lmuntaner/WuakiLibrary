class Api::MoviesController < ApplicationController

  def index
    @movies = Item.where(category: 'Movie').order('created_at DESC')
    render :index
  end
end
