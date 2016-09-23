Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'welcomes#index'

  resources :profiles

  resources :contacts

  #re-visit tutorail for routes for sending messages
  resources :send_message, only: [:create]

end
