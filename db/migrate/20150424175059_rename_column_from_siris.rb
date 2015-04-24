class RenameColumnFromSiris < ActiveRecord::Migration
  def change
  	rename_column :siris, :name, :title
		rename_column :siris, :plot, :description
  end
end
