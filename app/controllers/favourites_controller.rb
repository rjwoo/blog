class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def create
    favourite = current_user.favourites.new
    post = Post.find params[:post_id]
    favourite.post = post
    if favourite.save
      redirect_to post, notice: "Favourited!"
    else
      redirect_to post, alert: "Can't Favourite!"
    end
  end

  def destroy
    favourite = current_user.favourites.find params[:id]
    favourite.destroy
    redirect_to post, notice: "Unfavourited!"
  end
end
