class AddGalleryImageToSiris < ActiveRecord::Migration
  def change
    add_column :siris, :gallery_image_1, :string
    add_column :siris, :gallery_image_2, :string
    add_column :siris, :gallery_image_3, :string
  end
end
