class AddFeaturedToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :featured, :boolean
  end
end
