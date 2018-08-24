class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :post

    has_many :tags
    
  after_create do
    usertags = self.body.scan(/@[^0-9 ]*/)
    usertags.uniq.map do |usertag|
      if User.find_by(name: usertag.delete('@')).present?
        user = User.find_by(name: usertag.delete('@'))
        tag = Tag.find_by(body: usertag.delete('@'), # 태그한 유저 이름
                          user_id: user.id,           # 위 이름에 해당하는 user id
                          comment_id: self.id)        # 태그를 포함하는 comment id
        if tag.nil?  # 유저는 있는데, 생성된 태그가 없다
          Tag.create(body: usertag.delete('@'),
                     user_id: user.id,
                     comment_id: self.id)
        else         # 유저도 있고, 해당 유저 태그도 있다
          tag.update(body: usertag.delete('@'),
                     user_id: user.id,
                     comment_id: self.id)
        end
      end
    end
  end

end
