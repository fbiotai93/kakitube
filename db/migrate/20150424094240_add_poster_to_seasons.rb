class AddPosterToSeasons < ActiveRecord::Migration
  def change
  	add_column :seasons, :poster, :string
  end
end
