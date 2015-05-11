class AddMoreEmbedToEpisodes < ActiveRecord::Migration
  def change
    add_column :episodes, :embed2, :text
    add_column :episodes, :embed3, :text
  end
end
