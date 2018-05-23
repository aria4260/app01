class User < ApplicationRecord
  require "securerandom"

  has_many :posts, dependent: :destroy
  has_many :active_relationships, class_name: "Follow",
                                  foreign_key: "user_id",
                                  dependent: :destroy
  has_many :passive_relationships, class_name: "Follow",
                                   foreign_key: "follow_user_id",
                                   dependent: :destroy
  has_many :following, through: :active_relationships, source: :follow_user
  has_many :followers, through: :passive_relationships, source: :user
  has_many :likes
  has_many :comments

  validates :name, {presence: true}
  validates :email, {presence: true, uniqueness: true}
  validates :password_digest, {presence: true, length: { minimum: 6 }, confirmation: true}

  enum user_status: { non_verify: 0, verify: 1, withdraw: 99 }

  before_create :generate_verify_token

  def generate_verify_token
    self.verify_token = SecureRandom.uuid
  end
end
