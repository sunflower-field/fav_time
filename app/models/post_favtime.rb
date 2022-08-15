class PostFavtime < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :tag_middles
    has_many :likes, dependent: :destroy
    has_many :comments
  def liked?(user)
   likes.where(user_id: user.id).exists?
  end

end
