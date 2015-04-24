class AddSiriGenreToSiris < ActiveRecord::Migration
  def change
    add_reference :siris, :siri_genre, index: true
    add_foreign_key :siris, :siri_genres
  end
end
