Rails.application.routes.draw do
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'cart/show'
  devise_for :users

  get 'movies/:movie_id/screen/:screen_id/tickets', to: 'tickets#show', as: :tickets
  post 'movies/:movie_id/screen/:screen_id/tickets', to: 'order_items#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :users
  resources :movies
  resources :tickets
  resources :halls
  resources :feedbacks
  resources :seats
  resources :screens
  resources :order_items
  get 'cart', to:'cart#show'


end
