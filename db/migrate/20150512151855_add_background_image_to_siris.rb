class AddBackgroundImageToSiris < ActiveRecord::Migration
  def change
    add_column :siris, :bg_image, :string
  end
end
