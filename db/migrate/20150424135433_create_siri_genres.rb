class CreateSiriGenres < ActiveRecord::Migration
  def change
    create_table :siri_genres do |t|
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
  end
end
