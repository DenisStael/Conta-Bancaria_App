Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static_pages#index"

  get "entrar", to: "sessions#new"
  post "entrar", to: "sessions#create"
  delete "sair", to: "sessions#destroy"

  resources :accounts, only: [:new, :create, :show]
end
