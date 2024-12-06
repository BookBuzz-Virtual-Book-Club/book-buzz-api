class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index
  end

  def create
    @post = Post.create(
      discussion_board_id: params[:discussion_board_id],
      user_id: params[:user_id],
      content: params[:content],
    )
    render :show
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(
      discussion_board_id: params[:discussion_board_id] || @post.discussion_board_id,
      user_id: params[:user_id] || @post.user_id,
      content: params[:content] || @post.content,
    )
    render :show
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    render json: { message: "Post deleted successfully"}
  end
end
