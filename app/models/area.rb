class Area < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :prefecture, presence: true
  
  has_many :cities
  belongs_to :prefecture
end
