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
#
# Indexes
#
#  index_requests_on_user_id  (user_id)
#

class Request < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user_id, :title, :content
end
