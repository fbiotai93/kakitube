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

class Request < ActiveRecord::Base
  enum status: {"Pending" => 0, "Approved" => 1, "Rejected" => 2, "Closed" => 3}
  after_initialize :set_default_status, :if => :new_record?
  belongs_to :user

  validates_presence_of :user_id, :title, :content

  def is_pending?
    status === "Pending"
  end

  def is_approved?
    status === "Approved"
  end

  def is_rejected?
    status === "Rejected"
  end

  def is_closed?
    status === "Closed"
  end

  def set_default_status
    self.status ||= 0
  end
end
