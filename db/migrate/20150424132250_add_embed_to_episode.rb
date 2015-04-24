class AddEmbedToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :embed, :text
  end
end
