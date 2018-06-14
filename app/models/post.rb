class Post < ApplicationRecord
  belongs_to :user

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos

  has_many :tag_posts, dependent: :destroy
  has_many :tags, through: :tag_posts
  accepts_nested_attributes_for :tag_posts, allow_destroy: true

  acts_as_taggable_on :tags

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
end
