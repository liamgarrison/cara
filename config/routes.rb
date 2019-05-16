Rails.application.routes.draw do
  resources :vehicles, except: [:new, :create]

  resources :users, only: [] do
    resources :vehicles, only: [:new, :create]
  end

  devise_for :users
  root to: 'pages#home'
end
