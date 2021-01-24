class Restaurant < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 50 }
  validates :tel, presence: true, length: { maximum: 50 }
  validates :category, presence: true
  validates :city,presence: true
  validate :photo_size
  
  mount_uploader :photo, PhotoUploader
  
  has_many :favorites, dependent: :destroy
  has_many :users,through: :favorites, dependent: :destroy
  belongs_to :category
  belongs_to :city
  
  private

    # アップロードされた画像のサイズをバリデーションする
    def photo_size
      if photo.size > 5.megabytes
        errors.add(:photo, "should be less than 5MB")
      end
    end
end
