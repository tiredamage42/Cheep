Rails.application.routes.draw do
  
  resources :posts do

    member do
      put "like" => "posts#upvote"
      put "dislike" => "posts#downvote"
    
    end

    resources :comments
  
  end
  
  #use custom controllers ( our registration controller )
  devise_for :users, controllers: { registrations: 'registrations' }
  
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
