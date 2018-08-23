Rails.application.routes.draw do
  root 'posts#index'
  
  devise_for :users, :controllers => { omniauth_callbacks: 'user/omniauth_callbacks' }
 
# Posts

  #Read
  get '/posts/index'
  get '/posts/show/:post_id' => 'posts#show'
  
  #create
  get '/posts/new'
  post '/posts/create' => 'posts#create'
  
  
  #update
  get '/posts/edit/:post_id' => 'posts#edit'
  post '/posts/update/:post_id' => 'posts#update'
  
  #delete
  post '/posts/destroy/:post_id' => 'posts#destroy'

  
# Comments
  post '/comments/create' => 'comments#create'
  get '/comments/destroy/:id' => 'comments#destroy'

end