class CreateAnimeGenres < ActiveRecord::Migration
  def change
    create_table :anime_genres do |t|
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
  end
end
