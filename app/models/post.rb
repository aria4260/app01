class Post < ApplicationRecord
  belongs_to :user
  has_many :photos, depedent: :destroy
  has_many :tags, through: :tag_posts
  has_many :tag_posts
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
