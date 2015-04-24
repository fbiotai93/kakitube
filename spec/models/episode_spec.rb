# == Schema Information
#
# Table name: episodes
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  season_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  embed      :text(65535)
#
# Indexes
#
#  index_episodes_on_season_id  (season_id)
#

require 'rails_helper'

RSpec.describe Episode, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
