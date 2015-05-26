class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fullname, :string
    add_column :users, :about, :text
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
  end
end
