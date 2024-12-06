class User < ApplicationRecord
  has_many :book_clubs
  has_one :bookshelf
  has_many :user_books
  has_many :books, through: :user_books
  has_many :posts
end
