class Restaurant < ApplicationRecord
    mount_uploader :image, ImageUploader
  
    has_many :foods
    has_many :dailies
  
    validates :name, presence: true
    validates :address, presence: true
  
    class << self
      private
  
      def inheritance_column
        nil
      end
    end
end