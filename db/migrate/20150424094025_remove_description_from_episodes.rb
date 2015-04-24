class RemoveDescriptionFromEpisodes < ActiveRecord::Migration
  def up
  	remove_column :episodes, :description
  end
end
