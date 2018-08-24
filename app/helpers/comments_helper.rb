module CommentsHelper
  def getNameById(comment_user_id)
    comment = Comment.find_by(user_id: comment_user_id)
    name = User.find(comment.user_id).name
    return name
  end
  
  def getIdByName(userName)
    user = User.find_by(name: userName.delete('@'))
    if user.nil?
      return nil
    end
      
    return user.id
  end
  
  def render_user_tag(content)
    user = nil
    # @XXX 문자열이 없으면 그대로 출력 -->
    if content.scan(/@[^0-9 ]*/).map.first.nil?
      return content 
    # @XXX 문자열이 있다면?-->
    else
        # @XXX 형태의 문자열을 겹치는 값이 없는 배열로 저장
      content.scan(/@[^0-9 ]*/).map.each do |c|
        #@를 제거한 XXX를 이름으로 User 테이블에서 검색-
        user = User.find_by(name: c.delete('@'))
      end
        # user가 검색되었다면 

        # @이름으로 링크를 달아서 출력
        h content.gsub(/@[^0-9 ]*/){|word|
            link_to word.delete('@'), "/profile/mypage/#{getIdByName(word)}", class: "ui blue basic button"}.html_safe  
    end
  end
end
