Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movers do
    resources :bookings, only: [:new, :create]
  end

  namespace :mover do
    # resources :bookings, only: [:index, :update]\
    get "bookings", to: "bookings#index", as: "booking"
  end

  resources :bookings, only: [:index, :update]
end
