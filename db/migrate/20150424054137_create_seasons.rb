class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :title
      t.text :description
      t.belongs_to :siri, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
