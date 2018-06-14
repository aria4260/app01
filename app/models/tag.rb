class Tag < ApplicationRecord
  has_many :posts, through: :tag_posts
  has_many :tag_posts, dependent: :destroy
end
