class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :content
      t.integer :status

      t.timestamps null: false
    end
  end
end
