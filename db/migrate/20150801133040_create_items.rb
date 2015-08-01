class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title, null: false
      t.string :plot
      t.string :category, null: false

      t.timestamps null: false
    end

    drop_table :movies
    drop_table :seasons
    remove_column :episodes, :season_id
  end
end
