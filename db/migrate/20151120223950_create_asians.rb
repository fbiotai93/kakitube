class CreateAsians < ActiveRecord::Migration
  def change
    create_table :asians do |t|
      t.string :title
      t.string :slug
      t.string :status
      t.belongs_to :user, index: true, foreign_key: true
      t.string :imdbID
      t.integer :year
      t.string :rated
      t.string :released
      t.string :runtime
      t.string :director
      t.string :writer
      t.string :actors
      t.string :language
      t.string :country
      t.string :awards
      t.string :poster
      t.string :metascore
      t.string :imdbrating
      t.string :imdbvotes
      t.text :description
      t.belongs_to :asian_genre, index: true, foreign_key: true
      t.string :gallery_image_1
      t.string :gallery_image_2
      t.string :gallery_image_3
      t.string :header_image
      t.string :bg_image

      t.timestamps null: false
    end
    add_index :asians, :slug, unique: true
  end
end
