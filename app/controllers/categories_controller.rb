class CategoriesController < ApplicationController
  before_action :admin_user
  
  def new
    @category=Category.new
    @categories=Category.order(id: :desc)
  end

  def create
    @category=Category.new(category_params)
    
    if @category.save
      flash[:success]='登録しました'
      redirect_to new_category_path
    else
      flash.now[:danger]='登録に失敗しました'
      render :new
    end
  end

  def edit
    @category=Category.find(params[:id])
  end

  def update
    @category=Category.find(params[:id])
    
    
    if @category.update(category_params)
      flash[:success]='編集しました'
      redirect_to new_category_path
    else
      flash[:danger]='編集に失敗しました'
      render :new
    end
    
  end

  def destroy
    @category=Category.find(params[:id])
    @category.destroy
    redirect_to new_category_path
  end
  
  private

  def category_params
    params.require(:category).permit(:name)
  end
end
