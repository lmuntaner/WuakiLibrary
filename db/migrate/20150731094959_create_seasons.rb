class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :title, null: false

      t.timestamps null: false
    end
  end
end
