class TagMiddle < ApplicationRecord
  belongs_to :post_tag
  belongs_to :post_favtime

  validates :post_favtime_id, presence: true
  validates :post_tag_id, presence: true
end

