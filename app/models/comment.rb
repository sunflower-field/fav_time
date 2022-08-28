class Comment < ApplicationRecord
 belongs_to :user
 belongs_to :post_favtime

 validates :comment, presence: true
end
