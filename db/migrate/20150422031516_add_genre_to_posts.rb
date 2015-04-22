class AddGenreToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :genre, index: true
    add_foreign_key :posts, :genres
  end
end
