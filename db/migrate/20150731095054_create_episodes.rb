class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title, null: false
      t.string :plot
      t.references :season, index: true

      t.timestamps null: false
    end
  end
end
