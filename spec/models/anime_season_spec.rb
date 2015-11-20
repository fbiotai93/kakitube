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

require 'rails_helper'

RSpec.describe AnimeSeason, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
