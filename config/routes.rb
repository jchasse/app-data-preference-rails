Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Static
  root 'static#home'

  # Sessions
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  post '/logout' => 'session#destroy'

  # Models
   get '/signup' => 'users#new'
  resources :users, only: [:create, :show, :edit, :update, :destroy]

  resources :accounts
  
  resources :digitalprints, only: [:new, :create]

end
