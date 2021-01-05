Rails.application.routes.draw do
  devise_for :users


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :users
  resources :movies
  resources :tickets
  resources :halls
  resources :feedbacks
  resources :seats
  resources :screens


end
