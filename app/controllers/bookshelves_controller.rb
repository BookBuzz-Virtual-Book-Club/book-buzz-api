class BookshelvesController < ApplicationController
  def index
    @bookshelves = Bookshelf.all
    render :index
  end

  def create
    @bookshelf = Bookshelf.create(
      name: params[:name],
      user_id: params[:user_id],
    )
    render :show
  end

  def show
    @bookshelf = Bookshelf.find_by(id: params[:id])
    render :show
  end

  def update
    @bookshelf = Bookshelf.find_by(id: params[:id])
    @bookshelf.update(
      name: params[:name] || @bookshelf.name,
      user_id: params[:user_id] || @bookshelf.user_id,
    )
    render :show
  end

  def destroy
    @bookshelf = Bookshelf.find_by(id: params[:id])
    @bookshelf.destroy
    render json: { message: "Bookshelf deleted successfully"}
  end
end
