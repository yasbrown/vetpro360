Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "users/sign_out" => "devise/sessions#destroy"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "appointments#index"

  resources :appointments, only: [:index, :show]
  delete "appointments/:id", to: "appointments#destroy", as: :destroy_appointment

  resources :slots do
    resources :appointments, only: [:new, :create]
  end

  resources :owner_attributes do
    resources :animals, only: [:new, :create]
  end

  resources :animals, only: [:destroy, :edit, :update, :show] do
    get "archive_animal", to: "animals#archive_animal", as: :archive
    get "unarchive_animal", to: "animals#unarchive_animal", as: :unarchive
    member do
      resources :weights, only: [:create]
      get "history", to: "animals#history"
      post "history/notes", to: "notes#create", as: :note_create
      resources :medications, only: [:create]
      # get "history/notes/:note_id/edit", to: "notes#edit", as: :note_edit
      # patch "history/notes/:note_id", to: "notes#update", as: :note_update
    end
  end

  delete "medications/:id", to: "medications#destroy", as: :destroy_medication
  # resources :medications, only: [:destroy]
  resources :notes, only: [:edit, :update]
end
