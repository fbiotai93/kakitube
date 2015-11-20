# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  username               :string(255)      default(""), not null
#  admin                  :boolean          default(FALSE)
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  api_key                :string(255)
#  fullname               :string(255)
#  about                  :text(65535)
#  facebook               :string(255)
#  twitter                :string(255)
#
# Indexes
#
#  index_users_on_api_key               (api_key) UNIQUE
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  before_create :generate_api_key

  include PublicActivity::Model
  tracked except: [:create, :destroy, :update], owner: Proc.new{ |controller, model| controller.current_user }

  attr_accessor :login

  has_many :posts
  has_many :siris
  has_many :requests
  has_many :bookmarks, dependent: :destroy

  validates :username, :uniqueness => { :case_sensitive => false }, format: { with: /\A[-\w.]*\z/ }, presence: true
  validates :api_key, uniqueness: true
  validates :facebook, format: URI::regexp(%w(http https)), allow_blank: true
  validates :twitter, format: URI::regexp(%w(http https)), allow_blank: true

  default_scope -> { order('users.id DESC') }
  scope :online, lambda{ where("updated_at >= ?", 10.minutes.ago) }

  def is_admin?
  	admin === true
  end

  def is_online?
    updated_at >= 10.minutes.ago
  end

  def bookmarking?(item)
    self.bookmarks.find_by_bookmarkable_id_and_bookmarkable_type(item.id, item.class.name)
  end

  def self.find_first_by_auth_conditions(warden_conditions)
	  conditions = warden_conditions.dup
	  if login = conditions.delete(:login)
	    where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
	  else
	    if conditions[:username].nil?
	      where(conditions).first
	    else
	      where(username: conditions[:username]).first
	    end
	  end
	end

  protected

  def generate_api_key
    begin
      self.api_key = Devise.friendly_token
    end while self.class.exists?(api_key: api_key)
  end
end
