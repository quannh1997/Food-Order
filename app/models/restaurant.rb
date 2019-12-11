class Restaurant < ApplicationRecord
    mount_uploader :image, ImageUploader
  
    has_many :foods
    has_many :dailies
  
    validates :name, presence: true
    validates :address, presence: true
    
    def blank_stars
        5 - average_star.to_i
    end
  
    class << self
      private
  
      def inheritance_column
        nil
      end
    end
end