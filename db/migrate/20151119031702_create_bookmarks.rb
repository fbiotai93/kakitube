class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :bookmarkable, polymorphic: true

      t.timestamps
    end
    add_index :bookmarks, [:bookmarkable_id, :bookmarkable_type]
  end
end
