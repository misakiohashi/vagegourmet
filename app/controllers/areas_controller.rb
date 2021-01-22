class AreasController < ApplicationController
  before_action :admin_user
  
  def new
    @area=Area.new
    @areas=Area.order(id: :desc)
  end

  def create
    @area=Area.new(area_params)
    
    if @area.save
      flash[:success]='登録しました'
      redirect_to new_area_path
    else
      flash[:danger]='登録に失敗しました'
      render :new
    end
    
  end

  def edit
    @area=Area.find(params[:id])
  end

  def update
    @area=Area.find(params[:id])
    
    if @area.update(area_params)
      flash[:success]='編集しました'
      redirect_to new_area_path
    else
      flash[:danger]='編集に失敗しました'
      render :edit
    end
  end
  
  def destroy
    @area=Area.find(params[:id])
    @area.destroy
    redirect_to new_area_path
  end
  
  private
  
  def area_params
    params.require(:area).permit(:prefecture_id,:name)
  end
  
end
