Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "slots#index"

  resources :slots, only: %i[index]

  resources :users, only: %i[index, show, new, create, destroy] do
    resources :animals
  end
end
