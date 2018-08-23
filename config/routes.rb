Rails.application.routes.draw do
  root 'posts#index'
  
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks' }
 
  resources :posts
  resources :comments, only: [:create, :destroy]

end