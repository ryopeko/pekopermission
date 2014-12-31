Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :permissions

  resources :users, only: [:new, :create]

  get 'dashboard' => 'users#dashboard'

  match '/signin', to: 'sessions#new', via: :get
  match '/signout', to: 'sessions#destroy', via: :delete
end
