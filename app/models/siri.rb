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
#
# Indexes
#
#  index_siris_on_slug     (slug) UNIQUE
#  index_siris_on_user_id  (user_id)
#

class Siri < ActiveRecord::Base
  belongs_to :user
  has_many :seasons, dependent: :destroy

  accepts_nested_attributes_for :seasons, allow_destroy: true
end
