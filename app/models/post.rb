class Post < ApplicationRecord
  belongs_to :user

  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos

  acts_as_taggable

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :photo_date, {presence: true}
  validates :publish, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end
end
