Rails.application.routes.draw do
  
  resources :posts do

    resources :comments
  
  end
  
  #use custom controllers ( our registration controller )
  devise_for :users, controllers: { registrations: 'registrations' }
  
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
