class PostFavtime < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :tag_middles, dependent: :destroy
    has_many :post_tags, through: :tag_middles
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy

    validates :title, presence: true
    validates :introduction, presence: true
    validates :image, presence: true

  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end

  def self.search(search)
      return PostFavtime.all unless search
      PostFavtime.where('introduction LIKE(?) or title LIKE(?)', "%#{search}%", "%#{search}%")
  end

  def save_tag(sent_tags)
     current_tags = self.post_tags.pluck(:tag_name) unless self.post_tags.nil?
     old_tags = current_tags - sent_tags
     new_tags = sent_tags - current_tags

     old_tags.each do |old|
       self.post_tags.delete PostTag.find_by(tag_name: old)
     end

     new_tags.each do |new|
       new_post_tag = PostTag.find_or_create_by(tag_name: new)
       self.post_tags << new_post_tag
     end
  end

end
