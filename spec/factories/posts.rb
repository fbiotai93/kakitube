# == Schema Information
#
# Table name: posts
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  description     :text(65535)
#  embed           :text(65535)
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
#  plot            :string(255)
#  language        :string(255)
#  country         :string(255)
#  awards          :string(255)
#  poster          :string(255)
#  metascore       :string(255)
#  imdbrating      :string(255)
#  imdbvotes       :string(255)
#  genre_id        :integer
#  header_image    :string(255)
#  featured        :boolean
#  trailer         :string(255)
#  slug            :string(255)
#  gallery_image_1 :string(255)
#  gallery_image_2 :string(255)
#  gallery_image_3 :string(255)
#  embed2          :text(65535)
#  embed3          :text(65535)
#
# Indexes
#
#  index_posts_on_genre_id  (genre_id)
#  index_posts_on_slug      (slug) UNIQUE
#  index_posts_on_user_id   (user_id)
#

FactoryGirl.define do
  factory :post do
    title "Post Title"
		description "Post Description"
		embed "Embed Code"
		user
  end

end
