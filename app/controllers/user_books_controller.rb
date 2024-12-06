class UserBooksController < ApplicationController
  def index
    @user_books = UserBook.all 
    render :index
  end

  def create
    @user_book = UserBook.create(
      user_id: params[:user_id],
      book_id: params[:book_id],
      bookshelf_id: params[:bookshelf_id],
      rating: params[:rating],
      review: params[:review],
    )
    render :show
  end

  def show
    @user_book = UserBook.find_by(id: params[:id])
    render :show
  end

  def update
    @user_book = UserBook.find_by(id: params[:id])
    @user_book.update(
      user_id: params[:user_id] || @user_book.user_id,
      book_id: params[:book_id] || @user_book.book_id,
      bookshelf_id: params[:bookshelf_id] || @user_book.bookshelf_id,
      rating: params[:rating] || @user_book.rating,
      review: params[:review] || @user_book.review,
      created_at: params[:created_at] || @user_book.created_at,
      updated_at: params[:updated_at] || @user_book.updated_at,
    )
    render :show
  end

  def destroy
    @user_book = UserBook.find_by(id: params[:id])
    @user_book.destroy
    render json: { message: "UserBook deleted successfully"}
  end

end
