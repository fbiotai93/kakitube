# == Schema Information
#
# Table name: episodes
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text(65535)
#  season_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_episodes_on_season_id  (season_id)
#

class Episode < ActiveRecord::Base
  belongs_to :season
end
