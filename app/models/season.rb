# == Schema Information
#
# Table name: seasons
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  siri_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  poster     :string(255)
#
# Indexes
#
#  index_seasons_on_siri_id  (siri_id)
#

class Season < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  belongs_to :siri
  has_many :episodes, dependent: :destroy

  validates_presence_of :title

  # default_scope -> { includes(:episodes).order("episodes.created_at DESC") }
  default_scope -> { order('seasons.created_at ASC') }

end
