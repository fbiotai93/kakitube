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
	mount_uploader :poster, PosterUploader
	
  belongs_to :siri
  has_many :episodes, dependent: :destroy

  # accepts_nested_attributes_for :episodes, allow_destroy: true
end
