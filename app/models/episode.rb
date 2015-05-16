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

class Episode < ActiveRecord::Base
  belongs_to :season, touch: true

  after_commit :updated_series

  validates_presence_of :title
  validates_presence_of :embed

  default_scope -> { order('episodes.created_at ASC') }

  private

  def updated_series
  	self.season.siri.touch(:updated_at)
  end
end
