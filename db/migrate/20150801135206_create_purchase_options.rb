class CreatePurchaseOptions < ActiveRecord::Migration
  def change
    create_table :purchase_options do |t|
      t.references :purchase_option, index: true
      t.string :quality
      t.string :price, null: false

      t.timestamps null: false
    end
  end
end
