class AddPlotToSiris < ActiveRecord::Migration
  def change
    add_column :siris, :plot, :text
  end
end
