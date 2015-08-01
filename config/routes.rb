Rails.application.routes.draw do
  root 'sites#home'

  resources :users, only: [:create]

  namespace :api, defaults: { format: :json } do
    resources :movies, only: [:index]
    resources :seasons, only: [:index]
    resources :libraries, only: [:index]
    get 'libraries/:user_id' => 'libraries#show'
    resources :purchases, only: [:create]
  end
end
