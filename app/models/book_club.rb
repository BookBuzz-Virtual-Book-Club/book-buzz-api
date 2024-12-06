class BookClub < ApplicationRecord
  belongs_to :user
  has_one :discussion_board
end
