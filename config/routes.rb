Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  
  resources :vehicles except: [:new, :create]

  resources :users, only: [] do
    resources :vehicles, only: [:new, :create]
  end

  resources :bookings, only: [:new, :create, :show, :index] do
    resources :vehicles, only: [:new, :create]
  end
end
