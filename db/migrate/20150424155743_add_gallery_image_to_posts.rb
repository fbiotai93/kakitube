class AddGalleryImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :gallery_image_1, :string
    add_column :posts, :gallery_image_2, :string
    add_column :posts, :gallery_image_3, :string
  end
end
