class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    restaurant=Restaurant.find(params[:restaurant_id])
    current_user.favorite(restaurant)
    flash[:success]='行きたいお店に登録しました'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    restaurant=Restaurant.find(params[:restaurant_id])
    current_user.unfavorite(restaurant)
    flash[:success]='行きたいお店を解除しました'
    redirect_back(fallback_location: root_path)
  end
end
