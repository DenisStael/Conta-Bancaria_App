Rails.application.routes.draw do
  root to: "static_pages#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :accounts, only: [:new, :create, :show]
  resources :account_operations
end
