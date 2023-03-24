Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "appointments#index"

  resources :appointments, only: [:index, :show]

  resources :slots do
    resources :appointments, only: [:new, :create]
  end

  resources :users do
    resources :animals, only: [:new, :create]
  end

  resources :animals, only: [:destroy, :edit, :update, :show] do
    get "archive_animal", to: "animals#archive_animal", as: :archive
    get "unarchive_animal", to: "animals#unarchive_animal", as: :unarchive
  end

end
