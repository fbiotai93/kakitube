# == Schema Information
#
# Table name: siris
#
#  id              :integer          not null, primary key
#  title           :string(255)
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
#  description     :text(65535)
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

class Siri < ActiveRecord::Base
  mount_uploader :poster, PosterUploader
  mount_uploader :gallery_image_1, GalleryImage1Uploader
  mount_uploader :gallery_image_2, GalleryImage2Uploader
  mount_uploader :gallery_image_3, GalleryImage3Uploader
  
  belongs_to :user
  has_many :seasons, dependent: :destroy
  belongs_to :siri_genre

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders, :history]

  accepts_nested_attributes_for :seasons, allow_destroy: true

  default_scope -> { order('siris.updated_at DESC') }
  scope :by_siri_genre, -> (siri_genre_id) { where(siri_genre_id: siri_genre_id) }
  scope :latest_update, -> { unscope(:order).order('`siris`.updated_at DESC') }

  searchable do
    text :title, boost: 5
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

  def is_on_going?
    status === "On-Going"
  end

  def is_completed?
    status === "Completed"
  end
end
