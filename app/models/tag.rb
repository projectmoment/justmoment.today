class Tag < ActiveRecord::Base
    belongs_to :comment
    
    belongs_to :user,  :foreign_key => 'user_id'
   
end
