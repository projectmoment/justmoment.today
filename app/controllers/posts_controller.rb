class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    #모든 포스트를 보여주는 뷰
    @posts = Post.all
  end
  
  def show
    #한개의 포스트를 보여주는 뷰
    @post = Post.find(params[:post_id])
  end
  
  def new
    
  end
  
  def create
    @post = Post.new
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    
    redirect_to "/posts/show/#{@post.id}"
    
  end
  
  def edit
    @post = Post.find(params[:post_id])
  end
  
  def update
    @post = Post.find(params[:post_id])
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    redirect_to "/home/show/#{@post.id}"
  end
 
 def destroy
   @post = Post.find(params[:post_id])
   @post.destroy
   redirect_to '/'
 end
 
 def post_params
   params.require(:post).permit(:title, :contents, :image_url)
 end
 
end
class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    #모든 포스트를 보여주는 뷰
    @posts = Post.all
  end
  
  def show
    #한개의 포스트를 보여주는 뷰
    @post = Post.find(params[:post_id])
  end
  
  def new
    
  end
  
  def create
    @post = Post.new
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    
    redirect_to "/posts/show/#{@post.id}"
    
  end
  
  def edit
    @post = Post.find(params[:post_id])
  end
  
  def update
    @post = Post.find(params[:post_id])
    @post.title = params[:input_title]
    @post.content = params[:input_content]
    @post.save
    redirect_to "/home/show/#{@post.id}"
  end
 
 def destroy
   @post = Post.find(params[:post_id])
   @post.destroy
   redirect_to '/'
 end
 
 def post_params
   params.require(:post).permit(:title, :contents, :image_url)
 end
 
end
