class Food < ApplicationRecord
    # attr_accessible :id,:name,:type,:default_price,:restaurant_id,:status,:average_star,:description
    belongs_to :restaurant
    has_many :daily_foods
    # has_many :food_images
    has_many :user_favorite_foods
    has_many :comments
    # accepts_nested_attributes_for :food_images
    mount_uploader :image, ImageUploader
  
    validates :name, presence: true
    validates :type, presence: true
    validates :description, presence: true
  
    class << self
      private

    end
end