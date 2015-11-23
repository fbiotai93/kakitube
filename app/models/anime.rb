# == Schema Information
#
# Table name: animes
#
#  id              :integer          not null, primary key
#  title           :string(255)
#  slug            :string(255)
#  status          :string(255)
#  user_id         :integer
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
#  description     :text(65535)
#  anime_genre_id  :integer
#  gallery_image_1 :string(255)
#  gallery_image_2 :string(255)
#  gallery_image_3 :string(255)
#  header_image    :string(255)
#  bg_image        :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_animes_on_anime_genre_id  (anime_genre_id)
#  index_animes_on_slug            (slug) UNIQUE
#  index_animes_on_user_id         (user_id)
#

class Anime < ActiveRecord::Base
  mount_uploader :poster, PosterUploader
  mount_uploader :header_image, HeaderImageUploader
  mount_uploader :gallery_image_1, GalleryImage1Uploader
  mount_uploader :gallery_image_2, GalleryImage2Uploader
  mount_uploader :gallery_image_3, GalleryImage3Uploader
  process_in_background :poster
  process_in_background :header_image
  process_in_background :gallery_image_1
  process_in_background :gallery_image_2
  process_in_background :gallery_image_3

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  belongs_to :user
  has_many :anime_seasons, dependent: :destroy
  belongs_to :anime_genre
  has_many :bookmarks, as: :bookmarkable, dependent: :destroy

	accepts_nested_attributes_for :bookmarks, allow_destroy: true

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]
  default_scope -> { order('animes.updated_at DESC') }
  scope :by_anime_genre, -> (anime_genre_id) { where(anime_genre_id: anime_genre_id) }
  scope :latest_update, -> { unscope(:order).order('`animes`.updated_at DESC') }
  scope :random, -> { unscope(:order).order('RAND()') }

  searchable do
    text :title, boost: 5
    text :description
  end

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
  validates_presence_of :poster
  validates_presence_of :header_image

  def is_on_going?
    status === "On-Going"
  end

  def is_completed?
    status === "Completed"
  end
end
