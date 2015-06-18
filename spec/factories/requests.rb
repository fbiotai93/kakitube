# == Schema Information
#
# Table name: requests
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text(65535)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  status     :integer
#
# Indexes
#
#  index_requests_on_user_id  (user_id)
#

FactoryGirl.define do
  factory :request do
    title "MyString"
content "MyText"
user nil
  end

end
