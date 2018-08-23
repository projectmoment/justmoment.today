class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    
    require 'carrierwave/orm/activerecord'
    mount_uploader :image_url, ImageUploader
    
    enum game_type: ["lol", "battle"]
end
