Rails.application.routes.draw do
  devise_for :users
  resources :rent_agreements
  resources :categories, only: [:new, :create, :index, :edit, :update] do
    resources :records, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "main#index"
end
