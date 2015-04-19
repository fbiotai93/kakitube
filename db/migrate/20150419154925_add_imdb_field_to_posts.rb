class AddImdbFieldToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :imdbID, :string
    add_column :posts, :year, :integer
    add_column :posts, :rated, :string
    add_column :posts, :released, :string
    add_column :posts, :runtime, :string
    add_column :posts, :director, :string
    add_column :posts, :writer, :string
    add_column :posts, :actors, :string
    add_column :posts, :plot, :string
    add_column :posts, :language, :string
    add_column :posts, :country, :string
    add_column :posts, :awards, :string
    add_column :posts, :poster, :string
    add_column :posts, :metascore, :string
    add_column :posts, :imdbrating, :string
    add_column :posts, :imdbvotes, :string
  end
end
