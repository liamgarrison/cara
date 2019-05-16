Rails.application.routes.draw do
  resources :vehicles
  devise_for :users
  root to: 'pages#home'

end
