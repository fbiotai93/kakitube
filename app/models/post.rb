# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string(255)
#  description  :text(65535)
#  embed        :text(65535)
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  imdbID       :string(255)
#  year         :integer
#  rated        :string(255)
#  released     :string(255)
#  runtime      :string(255)
#  director     :string(255)
#  writer       :string(255)
#  actors       :string(255)
#  plot         :string(255)
#  language     :string(255)
#  country      :string(255)
#  awards       :string(255)
#  poster       :string(255)
#  metascore    :string(255)
#  imdbrating   :string(255)
#  imdbvotes    :string(255)
#  genre_id     :integer
#  header_image :string(255)
#  featured     :boolean
#  trailer      :string(255)
#
# Indexes
#
#  index_posts_on_genre_id  (genre_id)
#  index_posts_on_user_id   (user_id)
#

class Post < ActiveRecord::Base
	mount_uploader :poster, PosterUploader
	mount_uploader :header_image, HeaderImageUploader

  belongs_to :user
  belongs_to :genre

  default_scope -> { order('posts.id DESC') }
  scope :featured, -> { where(featured: true) }
  scope :published_only, -> { where(featured: false) }
  scope :by_genre, -> (genre_id) { where(genre_id: genre_id) }

  # validates :embed, presence: true
end
