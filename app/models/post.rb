class Post < ApplicationRecord
  belongs_to :discussion_board
  belongs_to :user
end
