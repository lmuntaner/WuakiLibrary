class ChangeReferenceOnPurchaseOption < ActiveRecord::Migration
  def change
    remove_column :purchase_options, :purchase_option_id
    add_column :purchase_options, :item_id, :integer
  end
end
