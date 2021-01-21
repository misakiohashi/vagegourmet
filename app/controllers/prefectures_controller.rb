class PrefecturesController < ApplicationController
  before_action :admin_user,only: [:new,:create,:edit,:update,:destroy]
  
  def index
    @prefectures1=Prefecture.find(1,2,3,4,5,6,7)
    @prefectures2=Prefecture.find(8,9,10,11,12,13,14)
    @prefectures3=Prefecture.find(15,16,17,18,19,20)
    @prefectures4=Prefecture.find(21,22,23,24)
    @prefectures5=Prefecture.find(25,26,27,28,29,30)
    @prefectures6=Prefecture.find(31,32,33,34,35)
    @prefectures7=Prefecture.find(36,37,38,39)
    @prefectures8=Prefecture.find(40,41,42,43,44,45,46,47)
  end
  
  def show
    @prefecture=Prefecture.find(params[:id])
    count_city(@prefecture)
  end
  
  def new
    @prefecture=Prefecture.new
    @prefectures=Prefecture.order(id: :desc)
  end

  def create
    @prefecture=Prefecture.new(prefecture_params)
    @prefectures=Prefecture.order(id: :desc)
    
    if @prefecture.save
      flash[:success]='登録しました'
      redirect_to new_prefecture_path
    else
      flash[:danger]='登録に失敗しました'
      render :new
    end
  end

  def edit
    @prefecture=Prefecture.find(params[:id])
  end

  def update
    @prefecture=Prefecture.find(params[:id])
    
    if @prefecture.update(prefecture_params)
      flash[:success]='編集しました'
      redirect_to new_prefecture_path
    else
      flash[:danger]='編集に失敗しました'
      render :new
    end
  end

  def destroy
    @prefecture=Prefecture.find(params[:id])
    @prefecture.destroy
    redirect_to new_prefecture_path
    
  end
  
  private

  def prefecture_params
    params.require(:prefecture).permit(:name)
  end
  
  
end
