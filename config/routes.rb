Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :permissions
  get 'dashboard' => 'users#dashboard'
end
