class AddImdbidToSiris < ActiveRecord::Migration
  def change
    add_column :siris, :imdbID, :string
  end
end
