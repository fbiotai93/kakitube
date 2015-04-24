class RemoveDescriptionFromSeasons < ActiveRecord::Migration
  def up
  	remove_column :seasons, :description
  end
end
