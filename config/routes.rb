Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'welcomes#index'

  resources :profiles

  resources :contacts

  post "/message", to: "contacts#message"
end
