Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # Public Route
      post '/registration', to: 'auth#registration'
      post '/login', to: 'auth#login'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
