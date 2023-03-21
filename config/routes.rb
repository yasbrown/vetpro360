Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "slots#index"

  resources :slots, only: %i[index]

  resources :users do
    resources :animals
  end

  # resources :animals, only: %i[destroy]
end
