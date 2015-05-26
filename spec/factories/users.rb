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

FactoryGirl.define do
  factory :user do
    username 'guest'
    email 'test@example.com'
    password 'secret123'
    password_confirmation 'secret123'
    confirmed_at Date.today
    admin false
  end
  factory :admin, :class => User do
    username 'admin'
    email 'admin@example.com'
    password 'secret123'
    password_confirmation 'secret123'
    confirmed_at Date.today
    admin true
  end
end
