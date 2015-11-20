# == Schema Information
#
# Table name: asian_episodes
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  asian_season_id :integer
#  embed           :text(65535)
#  embed2          :text(65535)
#  embed3          :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_asian_episodes_on_asian_season_id  (asian_season_id)
#

class AsianEpisode < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  belongs_to :asian_season, touch: true

  after_commit :updated_series

  validates_presence_of :title
  validates_presence_of :embed

  default_scope -> { order('asian_episodes.created_at ASC') }

  private

  def updated_series
  	self.asian_season.asian.touch(:updated_at)
  end
end
