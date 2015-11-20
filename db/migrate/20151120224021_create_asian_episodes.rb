class CreateAsianEpisodes < ActiveRecord::Migration
  def change
    create_table :asian_episodes do |t|
      t.string :title
      t.belongs_to :asian_season, index: true, foreign_key: true
      t.text :embed
      t.text :embed2
      t.text :embed3

      t.timestamps null: false
    end
  end
end
