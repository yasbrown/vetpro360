Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "slots#index"

  resources :slots, only: [:index]

  resources :users do
    resources :animals, only: [:new, :create]
  end

  resources :animals, only: [:destroy, :edit, :update, :show] do
    get "archive_animal", to: "animals#archive_animal", as: :archive
    get "unarchive_animal", to: "animals#unarchive_animal", as: :unarchive
  end
end
