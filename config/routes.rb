Rails.application.routes.draw do
  root 'posts#index'
  
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks' }

 get "posts/mypage/:id"       => "posts#mypage"
 get "posts/editmypage/:id"   => "posts#editmypage"
 post "posts/updatemypage/:id" => "posts#updatemypage"
  resources :posts do
      post "/like", to: "likes#like_toggle"
  end

  #resources :comments, only: [:create, :destroy]
  
  get '/posts/:post_id/comments'     => 'comments#create'
  get '/posts/:post_id/comments/:id' => 'comments#destroy'
  
  

end