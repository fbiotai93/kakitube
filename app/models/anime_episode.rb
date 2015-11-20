# == Schema Information
#
# Table name: anime_episodes
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  anime_season_id :integer
#  embed           :text(65535)
#  embed2          :text(65535)
#  embed3          :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_anime_episodes_on_anime_season_id  (anime_season_id)
#

class AnimeEpisode < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  belongs_to :anime_season, touch: true

  after_commit :updated_series

  validates_presence_of :title
  validates_presence_of :embed

  default_scope -> { order('anime_episodes.created_at ASC') }

  private

  def updated_series
  	self.anime_season.anime.touch(:updated_at)
  end
end
