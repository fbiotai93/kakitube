class AddHeaderImageToSiri < ActiveRecord::Migration
  def change
    add_column :siris, :header_image, :string
  end
end
