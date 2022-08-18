class PostTag < ApplicationRecord
  has_many :tag_middles, dependent: :destroy, foreign_key: 'tag_id'
  has_many :post_favtimes, through: :tag_middles
end
