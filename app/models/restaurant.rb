class Restaurant < ApplicationRecord
    mount_uploader :image, ImageUploader
  
    has_many :foods
    has_many :dailies
    has_and_belongs_to_many :orders

    validates :name, presence: true
    validates :address, presence: true

    def blank_stars
        5 - average_star.to_i
    end
  
    class << self
      private

    end
end