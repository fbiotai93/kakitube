class AddHeaderImageToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :header_image, :string
  end
end
