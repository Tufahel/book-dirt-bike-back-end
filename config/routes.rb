Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, defaults: { format: 'json' },
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  namespace :api, defaults: { format: 'json' } do
    get '/user-data', to: 'users#show'
    resources :users
    resources :motorcycles, only: [:index, :show, :create, :new, :destroy]
    resources :rentals
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
