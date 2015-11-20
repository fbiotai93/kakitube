class RenameColumnFromAnime < ActiveRecord::Migration
  def change
  	rename_column :animes, :desription, :description
  end
end
