class Prefecture < ApplicationRecord
 validates :name, presence: true, length: { maximum: 50 }
 
 has_many :areas, dependent: :destroy
 has_many :cities, dependent: :destroy
end
