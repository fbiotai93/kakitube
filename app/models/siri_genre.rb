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
end
