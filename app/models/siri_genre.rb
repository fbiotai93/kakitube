# == Schema Information
#
# Table name: siri_genres
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SiriGenre < ActiveRecord::Base
  after_create :clear_cache
  after_update :clear_cache

	def self.all_cached
		Rails.cache.fetch('SiriGenre.all') { all }
	end

	def clear_cache
		Rails.cache.delete('SiriGenre.all')
	end
end
