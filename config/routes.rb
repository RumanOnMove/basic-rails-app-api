Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Public Route
      post '/registration', to: 'auth#registration'
      post '/login', to: 'auth#login'

      # Private Route
      resources :users, only: [:index, :show, :create, :update, :destroy]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
