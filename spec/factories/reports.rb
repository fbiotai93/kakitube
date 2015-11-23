# == Schema Information
#
# Table name: reports
#
#  id         :integer          not null, primary key
#  content    :text(65535)
#  status     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url        :string(255)
#  category   :string(255)
#

FactoryGirl.define do
  factory :report do
    
  end

end
