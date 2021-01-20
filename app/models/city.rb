class City < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :prefecture, presence: true
  
  
  has_many :restaurants
  belongs_to :prefecture
end
