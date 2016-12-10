Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # cancel sign up with facebook
  # errored out with 'r routes' command
 # devise_scope :user do
 #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
 # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'welcomes#index'

  resources :profiles

  resources :contacts

  post "/message", to: "contacts#message"
end
