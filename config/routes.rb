Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :vehicles, except: [:new, :create]

  resources :users, only: [] do
    resources :vehicles, only: [:index, :new, :create]
    resources :bookings, only: [:index]
  end

  resources :vehicles, only: [:new, :create] do
    resources :bookings, only: [:new, :create, :edit, :update]
  end
  resources :bookings, only: [:show, :destroy]
end

