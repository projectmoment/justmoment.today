class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    
    require 'carrierwave/orm/activerecord'
    mount_uploader :image, ImageUploader
    
    enum game_type: ["lol", "battle", "blizzard", "nexon", "steam", "mobile"]
end
