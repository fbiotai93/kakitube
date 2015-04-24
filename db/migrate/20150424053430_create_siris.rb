class CreateSiris < ActiveRecord::Migration
  def change
    create_table :siris do |t|
      t.string :name
      t.string :slug
      t.string :status
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :siris, :slug, unique: true
  end
end
