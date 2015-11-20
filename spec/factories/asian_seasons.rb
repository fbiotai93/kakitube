# == Schema Information
#
# Table name: asian_seasons
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  asian_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_asian_seasons_on_asian_id  (asian_id)
#

FactoryGirl.define do
  factory :asian_season do
    
  end

end
