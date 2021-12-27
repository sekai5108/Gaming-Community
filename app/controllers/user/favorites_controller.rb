class User::FavoritesController < ApplicationController

  before_action :authenticate_user!

  def create
    @community = Community.find(params[:community_id])
    favorite = @community.favorites.new(user_id: current_user.id)
    favorite.save
  end

  def destroy
    @community = Community.find(params[:community_id])
    favorite = @community.favorites.find_by(user_id: current_user.id)
    favorite.destroy
  end

end
