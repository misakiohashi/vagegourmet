class City < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :prefecture, presence: true
  validates :explanation,length: { maximum:300 }
  
  
  has_many :restaurants, dependent: :destroy
  belongs_to :prefecture
  belongs_to :area
end
