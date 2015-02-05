Rails.application.routes.draw do
  use_doorkeeper do
    controllers :applications => 'oauth/applications'
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :permissions

  resources :users, only: [:new, :create]

  get 'dashboard' => 'users#dashboard'

  match '/signin', to: 'sessions#new', via: :get
  match '/signout', to: 'sessions#destroy', via: :delete

  scope path: :api, module: :api do
    resources :users, only: [:show, :index]
  end
end
