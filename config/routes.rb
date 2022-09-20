Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "motorcycles#index"
  # resources :motorcycles
  namespace :api do
    resources :users
    resources :motorcycles, only: [:index, :create, :destroy]
    resources :rentals, only: [:index, :create, :destroy]
  end

end
