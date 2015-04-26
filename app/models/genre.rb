# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string(255)
#

class Genre < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders, :history]
  after_create :clear_cache
  after_update :clear_cache
  
	has_many :posts

	def self.all_cached
		Rails.cache.fetch('Genre.all') { all }
	end

	def clear_cache
		Rails.cache.delete('Genre.all')
	end
end
