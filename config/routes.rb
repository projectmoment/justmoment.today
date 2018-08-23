Rails.application.routes.draw do
  root 'posts#index'
  
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks' }
 
 get "posts/mypage"
  resources :posts
  #resources :comments, only: [:create, :destroy]
  
  get '/posts/:post_id/comments'     => 'comments#create'
  get '/posts/:post_id/comments/:id' => 'comments#destroy'
  

end