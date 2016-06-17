class CommentsController < ApplicationController
  before_action :find_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new comment_params
    @comment.user = current_user
    @post = Post.find params[:post_id]
    @comment.post = @post
    if @comment.save
      flash[:notice] = "Comment Posted!"
      redirect_to post_path(@post), notice: "Comment Posted!"
    else
      redirect_to post_path(@post), notice: "error"
    end
  end

  def show
    @post = Post.new
  end

  def index
    @comments = Comment.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @comment.update comment_params
      redirect_to comment_path(@comment), notice
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to posts_path, notice: "Comment deleted!"
  end

  private

  def find_comment
    @comment = Comment.find params[:id]
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end

  def authenticate_user!
    redirect_to new_session_path, alert: "Please sign in" unless user_signed_in?
  end

end
