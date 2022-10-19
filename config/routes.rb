Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'dashboard#index'

  resources :clients, only: [:index, :new, :create]
  resources :plumbers, only: [:index, :new, :create]
  resources :jobs, only: [:index, :new, :create]

  namespace :api do
    namespace :v1 do
      resources :jobs do
        member do
          put :mark_job_as_completed
        end
      end

      resources :plumbers do
        member do
          get :jobs_by_plumber_and_period
        end
      end
    end
  end

  devise_for :admins
end
