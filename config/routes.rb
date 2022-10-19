Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'

  resources :clients, only: [:index, :new, :create]
  resources :plumbers, only: [:index, :new, :create]

  devise_for :admins
end
