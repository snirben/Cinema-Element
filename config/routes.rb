Rails.application.routes.draw do
  resources :categories
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'cart/show'
  devise_for :users

  get 'movies/:movie_id/screen/:screen_id/tickets', to: 'tickets#show', as: :tickets
  get 'order/:id', to: 'order#see_cart', as: :order_cart
  get 'order/:id/checkout', to: 'order#checkout', as: :order_checkout
  get 'order/thankyou', to: 'order#thankyou', as: :thankyou

  #Screen
  post 'movies/:movie_id/screen/update', to: 'screens#update', as: :update_screen
  post 'movies/:movie_id/screen/new', to: 'screens#new', as: :add_screen
  post 'movies/:movie_id/screens/:screen_id/edit', to: 'screens#edit', as: :edit_screen
  delete 'movies/:movie_id/screen/:screen_id/delete/', to: 'screens#destroy', as: :remove_screen

  post 'movies/:movie_id/screen/:screen_id/tickets', to: 'order_items#add_to_cart' , as: :add_to_cart
  delete 'order/remove', to: 'order_items#remove_from_cart', as: :remove_from_cart
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
  resources :order
  get 'cart', to:'cart#show'


end
