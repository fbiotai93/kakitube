class AddBackgroundImageToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :bg_image, :string
  end
end
