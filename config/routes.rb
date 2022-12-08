Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :pets do
    resources :treatments, only: %i[new create show]
    resources :appointments, only: %i[new create]
  end
  resources :treatments, only: %i[edit update destroy]
  resources :appointments, only: %i[edit update destroy]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
