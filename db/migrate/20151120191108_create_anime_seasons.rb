class CreateAnimeSeasons < ActiveRecord::Migration
  def change
    create_table :anime_seasons do |t|
      t.string :title
      t.belongs_to :anime, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
