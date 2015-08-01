class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :purchase_option, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
