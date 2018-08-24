module PostsHelper
    def getNameById(user_id)
        name = User.find(user_id)
        retrun name
    end
end
