# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  content    :text(65535)
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Report < ActiveRecord::Base
  enum status: {"Pending" => 0, "Solved" => 1}
  after_initialize :set_default_status, :if => :new_record?

  validates_presence_of :content

  def is_pending?
    status === "Pending"
  end

  def is_solved?
    status === "Solved"
  end

  def set_default_status
    self.status ||= 0
  end
end
