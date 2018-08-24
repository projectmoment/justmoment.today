module PostsHelper
  def getNameById(user_id)
 
    name = User.find(user_id).name
    if name.nil?
      return nil
    end
    
    return name
  end
  
  def getIdByName(userName)
    user = User.find_by(name: userName.delete('@'))
    if user.nil?
      return nil
    end
      
    return user.id
  end
end
