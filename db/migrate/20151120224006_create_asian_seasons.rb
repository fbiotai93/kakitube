class CreateAsianSeasons < ActiveRecord::Migration
  def change
    create_table :asian_seasons do |t|
      t.string :title
      t.belongs_to :asian, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
