class PostFavtime < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :tag_middles
  has_many :likes
  has_many :comments
end
