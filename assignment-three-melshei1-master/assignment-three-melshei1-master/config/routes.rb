Rails.application.routes.draw do

# Create root for the home page

  devise_for :users


  root to: "pages#index"
  resources :makes
  resources :parts
  resources :cars


end
