# == Schema Information
#
# Table name: siris
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  slug            :string(255)
#  status          :string(255)
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  imdbID          :string(255)
#  year            :integer
#  rated           :string(255)
#  released        :string(255)
#  runtime         :string(255)
#  director        :string(255)
#  writer          :string(255)
#  actors          :string(255)
#  language        :string(255)
#  country         :string(255)
#  awards          :string(255)
#  poster          :string(255)
#  metascore       :string(255)
#  imdbrating      :string(255)
#  imdbvotes       :string(255)
#  plot            :text(65535)
#  siri_genre_id   :integer
#  gallery_image_1 :string(255)
#  gallery_image_2 :string(255)
#  gallery_image_3 :string(255)
#
# Indexes
#
#  index_siris_on_siri_genre_id  (siri_genre_id)
#  index_siris_on_slug           (slug) UNIQUE
#  index_siris_on_user_id        (user_id)
#

require 'rails_helper'

RSpec.describe Siri, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
