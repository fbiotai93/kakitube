# == Schema Information
#
# Table name: siris
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  slug       :string(255)
#  status     :string(255)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  imdbID     :string(255)
#
# Indexes
#
#  index_siris_on_slug     (slug) UNIQUE
#  index_siris_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Siri, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
