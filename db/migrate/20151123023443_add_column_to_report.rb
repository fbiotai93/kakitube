class AddColumnToReport < ActiveRecord::Migration
  def change
    add_column :reports, :url, :string
    add_column :reports, :category, :string
  end
end
