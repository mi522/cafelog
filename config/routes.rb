Rails.application.routes.draw do
    devise_for :users
    get 'posts/:post_id/likes' => 'likes#create'
    get 'posts/:post_id/likes/:id' => 'likes#destroy'
    resources :posts do
     resources :likes, only: [:create, :destroy]
     resources :comments, only: [:create]

    
     
    end


    root 'posts#index'


 end

 


