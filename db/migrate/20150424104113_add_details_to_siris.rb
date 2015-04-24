class AddDetailsToSiris < ActiveRecord::Migration
  def change
    add_column :siris, :year, :integer
    add_column :siris, :rated, :string
    add_column :siris, :released, :string
    add_column :siris, :runtime, :string
    add_column :siris, :director, :string
    add_column :siris, :writer, :string
    add_column :siris, :actors, :string
    add_column :siris, :language, :string
    add_column :siris, :country, :string
    add_column :siris, :awards, :string
    add_column :siris, :poster, :string
    add_column :siris, :metascore, :string
    add_column :siris, :imdbrating, :string
    add_column :siris, :imdbvotes, :string
  end
end
