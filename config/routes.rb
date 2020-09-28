Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Static
  root 'static#home'

  # Sessions
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'

  # Models
   get '/signup' => 'users#new'
  resources :users, only: [:create, :show, :edit, :update, :destroy]

  resources :accounts
  
  resources :digitalprints, only: [:new, :create]

end
