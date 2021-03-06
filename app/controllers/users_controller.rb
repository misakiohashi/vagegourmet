class UsersController < ApplicationController
   before_action :require_user_logged_in,only: [:show]
  
  def show
    @user=User.find(params[:id])
    count_restaurant(@user)
    @user_restaurants=@user.restaurants.all.page(params[:page]).per(5)
  end

  def new
    @user=User.new
  end

  def create
    @user=User.new(user_params)
    
    if @user.save
      flash[:success]='登録しました'
      redirect_to ('/login')
    else
      flash.now[:danger]='登録に失敗しました'
      render :new
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
