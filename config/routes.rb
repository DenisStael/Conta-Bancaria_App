Rails.application.routes.draw do
  root to: "static_pages#index"

  get "entrar", to: "sessions#new"
  post "entrar", to: "sessions#create"
  delete "sair", to: "sessions#destroy"

  resources :accounts, only: [:new, :create, :show]
  resources :account_operations
end
