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
#
# Indexes
#
#  index_users_on_api_key               (api_key) UNIQUE
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

require 'rails_helper'

RSpec.describe User, type: :model do
	it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  describe 'validation' do
    it "should be invalid without a username" do
      expect(FactoryGirl.build(:user, username: nil)).not_to be_valid
    end

    it "should be invalid without a email" do
      expect(FactoryGirl.build(:user, email: nil)).not_to be_valid
    end

    it "should be valid with a username" do
      expect(FactoryGirl.build(:user, username: :username)).to be_valid
    end

    it "should be valid with an email" do
      expect(FactoryGirl.build(:user, email: "test@example.com")).to be_valid
    end

    it "should be invalid without a unique username" do
      expect(User.find_or_create_by(username: :username)).not_to be_valid
    end

    it "should be valid with a unique username" do
      expect(FactoryGirl.build(:user, username: :username)).to be_valid
    end

    it "should be invalid without a unique email" do
      expect(User.find_or_create_by(email: :email)).not_to be_valid
    end

    it "should be valid with a unique email" do
      expect(FactoryGirl.build(:user, email: "test@example.com")).to be_valid
    end
  end
end
