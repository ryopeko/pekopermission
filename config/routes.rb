Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :permissions

  resources :users, only: [:new, :create]

  get 'dashboard' => 'users#dashboard'

  match '/login', to: 'sessions#new', via: :get
  match '/logout', to: 'sessions#destroy', via: :delete
end
