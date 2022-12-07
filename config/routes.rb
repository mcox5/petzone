Rails.application.routes.draw do
  get 'appointments/index'
  get 'appointments/show'
  get 'appointments/create'
  get 'appointments/new'
  get 'appointments/edit'
  get 'appointments/update'
  get 'appointments/destroy'
  get 'treatments/index'
  get 'treatments/show'
  get 'treatments/create'
  get 'treatments/new'
  get 'treatments/edit'
  get 'treatments/update'
  get 'treatments/destroy'
  devise_for :users
  root to: "pages#home"
  resources :pets do
    resources :treatments, only: [:new, :create]
    resources :appointments, only: [:new, :create]
  end
  resources :treatments, only: [:show, :edit, :update, :destroy]
  resources :appointments, only: [:index, :show, :edit, :update, :destroy]


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
