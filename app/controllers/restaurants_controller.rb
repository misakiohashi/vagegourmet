class RestaurantsController < ApplicationController
  before_action :require_user_logged_in
  before_action :admin_user
  
  def index
  end
  
  def new
    @restaurant=Restaurant.new
  end
  
  def create
    @restaurant=Restaurant.new(restaurant_params)

    if @restaurant.save
      flash[:success]='登録しました'
      redirect_to city_path(@restaurant.city)
    else
      flash[:danger]='登録に失敗しました'
      render :new
    end
  end


  def edit
    @restaurant=Restaurant.find(params[:id])
  end

  def update
    @restaurant=Restaurant.find(params[:id])
    
    if @restaurant.update(restaurant_params)
      flash[:success]='編集しました'
      redirect_to city_path(@restaurant.city)
    else
      flash[:danger]='編集に失敗しました'
      render :edit
    end
  end

  def destroy
    @restaurant=Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_back(fallback_location: root_path)
  end
  
  
  
  private
  

  def restaurant_params
    params.require(:restaurant).permit(:name,:address,:tel,:holiday,:category_id,:city_id,:photo)
  end
end
