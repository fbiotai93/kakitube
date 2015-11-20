# == Schema Information
#
# Table name: anime_seasons
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  anime_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_anime_seasons_on_anime_id  (anime_id)
#

class AnimeSeason < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  belongs_to :anime
  has_many :anime_episodes, dependent: :destroy

  validates_presence_of :title

  default_scope -> { order('anime_seasons.created_at ASC') }
end
