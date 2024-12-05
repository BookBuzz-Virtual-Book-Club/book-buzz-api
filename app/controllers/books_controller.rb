class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def create
    @book = Book.create(
      title: params[:title],
      author: params[:author],
      isbn: params[:isbn],
      publication_date: params[:publication_date],
      genre: params[:genre],
    )
    render :show
  end

  def show
    @book = Book.find_by(id: params[:id])
    render :show
  end

  def update
    @book = Book.find_by(id: params[:id])
    @book.update(
      title: params[:title] || @book.title,
      author: params[:author] || @book.author,
      isbn: params[:isbn] || @book.isbn,
      publication_date: params[:publication_date] || @book.publication_date,
      genre: params[:genre] || @book.genre,
    )
    render :show
  end

  def destroy
    @book = Book.find_by(id: params[:id])
    @book.destroy
    render json: { message: "Book deleted successfully" }
  end
end
