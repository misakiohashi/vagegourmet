class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  def counts(user)
    @count_restaurants=user.restaurants.count
  end
  
  def count_city(prefecture)
    @count_cities=prefecture.cities.count
  end
  
  def count_restaurant(city)
    @count_restaurant=city.restaurants.count
  end
  
  private
  
  def admin_user
      redirect_to(root_url) unless current_user.admin?
  end
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
