class DiscussionBoard < ApplicationRecord
  belongs_to :book_club
  has_many :posts
end
