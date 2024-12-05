class BookClubsController < ApplicationController
  def index
    @book_clubs = BookClub.all
    render :index
  end

  def create
    @book_club = BookClub.create(
      user_id: params[:user_id],
      name: params[:name],
      description: params[:description],
    )
    render :show
  end

  def show
    @book_club = BookClub.find_by(id: params[:id])
    render :show
  end

  def update
    @book_club = BookClub.find_by(id: params[:id])
    @book_club.update(
      user_id: params[:user_id] || @book_club.user_id,
      name: params[:name] || @book_club.name,
      description: params[:description] || @book_club.description,
    )
    render :show
  end

  def destroy
    @book_club = BookClub.find_by(id: params[:id])
    @book_club.destroy
    render json: { message: "Book Club deleted successfully"}
  end

end
