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

class Season < ActiveRecord::Base
  belongs_to :siri
  has_many :episodes, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]

  accepts_nested_attributes_for :episodes, allow_destroy: true
end
