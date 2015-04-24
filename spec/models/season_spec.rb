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

require 'rails_helper'

RSpec.describe Season, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
