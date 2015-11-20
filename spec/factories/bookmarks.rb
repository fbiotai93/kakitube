# == Schema Information
#
# Table name: bookmarks
#
#  id                :integer          not null, primary key
#  user_id           :integer
#  bookmarkable_id   :integer
#  bookmarkable_type :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#
# Indexes
#
#  index_bookmarks_on_bookmarkable_id_and_bookmarkable_type  (bookmarkable_id,bookmarkable_type)
#  index_bookmarks_on_user_id                                (user_id)
#

FactoryGirl.define do
  factory :bookmark do
    
  end

end
