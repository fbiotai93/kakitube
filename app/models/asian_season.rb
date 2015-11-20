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

class AsianSeason < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  belongs_to :asian
  has_many :asian_episodes, dependent: :destroy

  validates_presence_of :title

  default_scope -> { order('asian_seasons.created_at ASC') }
end
