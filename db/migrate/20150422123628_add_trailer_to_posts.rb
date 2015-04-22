class AddTrailerToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :trailer, :string
  end
end
