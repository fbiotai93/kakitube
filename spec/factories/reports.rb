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

FactoryGirl.define do
  factory :report do
    
  end

end
