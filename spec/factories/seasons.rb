# == Schema Information
#
# Table name: seasons
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text(65535)
#  siri_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_seasons_on_siri_id  (siri_id)
#

FactoryGirl.define do
  factory :season do
    title "MyString"
description "MyText"
siri nil
  end

end
