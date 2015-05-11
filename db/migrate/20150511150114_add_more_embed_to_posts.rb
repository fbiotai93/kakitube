class AddMoreEmbedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :embed2, :text
    add_column :posts, :embed3, :text
  end
end
