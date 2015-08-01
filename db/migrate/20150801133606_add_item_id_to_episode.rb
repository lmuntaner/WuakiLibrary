class AddItemIdToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :item_id, :integer
  end
end
