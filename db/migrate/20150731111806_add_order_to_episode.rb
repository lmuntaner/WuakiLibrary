class AddOrderToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :order, :integer
  end
end
