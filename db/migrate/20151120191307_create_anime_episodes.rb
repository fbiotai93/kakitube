class CreateAnimeEpisodes < ActiveRecord::Migration
  def change
    create_table :anime_episodes do |t|
      t.string :title
      t.belongs_to :anime_season, index: true, foreign_key: true
      t.text :embed
      t.text :embed2
      t.text :embed3

      t.timestamps null: false
    end
  end
end
