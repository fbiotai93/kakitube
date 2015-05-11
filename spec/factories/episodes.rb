# == Schema Information
#
# Table name: episodes
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  season_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  embed      :text(65535)
#  embed2     :text(65535)
#  embed3     :text(65535)
#
# Indexes
#
#  index_episodes_on_season_id  (season_id)
#

FactoryGirl.define do
  factory :episode do
    title "MyString"
description "MyText"
season nil
  end

end
