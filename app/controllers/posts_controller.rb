class PostsController < ApplicationController
before_action :post_params, only: [:create, :update]
before_action :find_post, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
before_action :authorize_owner, only: [:edit, :destroy, :update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    puts current_user
  end

  def index
    @posts = Post.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to post_path(@post), notice: "Post updated!"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post deleted!"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

  def find_post
    @post = Post.find params[:id]
  end

  def authenticate_user!
    redirect_to new_session_path, alert: "Please sign in" unless user_signed_in?
  end

  def authorize_owner
    redirect_to root_path, alert: "Access Denied" unless can? :manage, @post
  end

end
