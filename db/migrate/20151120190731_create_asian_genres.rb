class CreateAsianGenres < ActiveRecord::Migration
  def change
    create_table :asian_genres do |t|
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
  end
end
