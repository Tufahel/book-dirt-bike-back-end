Rails.application.routes.draw do
  devise_for :users, defaults: { format: 'json' },
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  namespace :api, defaults: { format: 'json' } do
    get '/user-data', to: 'users#show'
    resources :motorcycles, only: [:index, :show, :create, :new, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
