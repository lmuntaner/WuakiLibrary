class SitesController < ApplicationController

  def home
    @new_user = User.new
  end
end
