# == Schema Information
#
# Table name: asian_episodes
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  asian_season_id :integer
#  embed           :text(65535)
#  embed2          :text(65535)
#  embed3          :text(65535)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_asian_episodes_on_asian_season_id  (asian_season_id)
#

require 'rails_helper'

RSpec.describe AsianEpisode, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
