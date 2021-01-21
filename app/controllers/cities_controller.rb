class CitiesController < ApplicationController
  before_action :admin_user,only: [:new,:create,:edit,:update,:destroy]
  
  def show
    @city=City.find(params[:id])
    count_restaurant(@city)
  end
  
  def new
    @city=City.new
    @cities=City.order(id: :desc)
  end

  def create
    @city=City.new(city_params)
    
    if @city.save
      flash[:success]='登録しました'
      redirect_to new_city_path
    else
      flash[:danger]='登録に失敗しました'
      render :new
    end
  end

  def edit
    @city=City.find(params[:id])
  end

  def update
    @city=City.find(params[:id])
    
    if @city.update(city_params)
      flash[:success]='編集しました'
      redirect_to new_city_path
    else
      flash[:danger]='編集に失敗しました'
      render :edit
    end
  end

  def destroy
    @city=City.find(params[:id])
    @city.destroy
    redirect_to new_city_path
  end
  
  private

  def city_params
    params.require(:city).permit(:prefecture_id,:name)
  end
end



