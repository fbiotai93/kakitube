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
#  bg_image        :string(255)
#
# Indexes
#
#  index_posts_on_genre_id  (genre_id)
#  index_posts_on_slug      (slug) UNIQUE
#  index_posts_on_user_id   (user_id)
#

class Post < ActiveRecord::Base
	mount_uploader :poster, PosterUploader
	mount_uploader :header_image, HeaderImageUploader
  mount_uploader :gallery_image_1, GalleryImage1Uploader
  mount_uploader :gallery_image_2, GalleryImage2Uploader
  mount_uploader :gallery_image_3, GalleryImage3Uploader
  mount_uploader :bg_image, BackgroundImageUploader
  process_in_background :poster
  process_in_background :header_image
  process_in_background :gallery_image_1
  process_in_background :gallery_image_2
  process_in_background :gallery_image_3
  process_in_background :bg_image

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]

  belongs_to :user
  belongs_to :genre

  default_scope -> { order('posts.updated_at DESC') }
  scope :featured, -> { where(featured: true) }
  scope :published_only, -> { where(featured: false) }
  scope :by_genre, -> (genre_id) { where(genre_id: genre_id) }
  scope :random, -> { unscope(:order).order('RAND()') }

  searchable do
    text :title, boost: 5
    text :description
  end

  validates_presence_of :embed
  validates_presence_of :title
  validates_presence_of :year
  validates_presence_of :released
  validates_presence_of :runtime
  validates_presence_of :director
  validates_presence_of :writer
  validates_presence_of :actors
  validates_presence_of :description
  validates_presence_of :language
  validates_presence_of :country
  validates_presence_of :trailer
  validates_presence_of :poster
  validates_presence_of :header_image
  validates_presence_of :bg_image

  def is_featured?
    featured == true
  end
  
end
