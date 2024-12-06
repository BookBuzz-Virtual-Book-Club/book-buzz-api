class DiscussionBoardsController < ApplicationController
  def index
    @discussion_boards = DiscussionBoard.all 
    render :index
  end

  def create
    @discussion_board = DiscussionBoard.create(
      name: params[:name],
      book_club_id: params[:book_club_id],
    )
    render :show
  end

  def show
    @discussion_board = DiscussionBoard.find_by(id: params[:id])
    render :show
  end

  def update
    @discussion_board = DiscussionBoard.find_by(id: params[:id])
    @discussion_board.update(
      name: params[:name] || @discussion_board.name,
      book_club_id: params[:book_club_id] || @discussion_board.book_club_id,
      created_at: params[:created_at] || @discussion_board.created_at,
      updated_at: params[:updated_at] || @discussion_board.updated_at,
    )
    render :show
  end

  def destroy
    @discussion_board = DiscussionBoard.find_by(id: params[:id])
    @discussion_board.destroy
    render json: { message: "Discussion board deleted successfully"}
  end
end
