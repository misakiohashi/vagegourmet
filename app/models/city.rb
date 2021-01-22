class City < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :prefecture, presence: true
  validates :explanation,length: { maximum:300 }
  
  
  has_many :restaurants
  belongs_to :prefecture
end
