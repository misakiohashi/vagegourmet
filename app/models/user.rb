class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    has_many :favorites, dependent: :destroy
    has_many :restaurants,through: :favorites, dependent: :destroy
    
     def favorite(restaurant)
         self.favorites.find_or_create_by(restaurant_id: restaurant.id)
     end
     
     def unfavorite(restaurant)
         favorite = self.favorites.find_by(restaurant_id: restaurant.id)
         favorite.destroy if favorite
     end
     
     def favorite?(restaurant)
         self.restaurants.include?(restaurant)
     end
end
