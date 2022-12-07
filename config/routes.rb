Rails.application.routes.draw do
  get 'treatments/create'
  get 'treatments/new'
  get 'treatments/edit'
  get 'treatments/update'
  get 'treatments/destroy'
  devise_for :users
  root to: "pages#home"
  resources :pets do
    resources :treatments, only: %i[new create]
    resources :appointments, only: %i[new create index]
  end
  resources :treatments, only: %i[show edit update destroy]
  resources :appointments, only: %i[show edit update destroy]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
