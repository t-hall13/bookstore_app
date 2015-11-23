Rails.application.routes.draw do
  root to: "catalogs#index"
  
  namespace :admin do
    get 'base/index'
    get '/add_publisher', to: 'publishers#new', as: 'add_publisher'
    resources :authors
    resources :publishers
    resources :books
  end
  
  get '/signup', to: 'users#new', as: 'signup'
  get '/signin', to: 'sessions#new', as: 'signin'
  post '/signin', to: 'sessions#create'
  
  
  
  resources :users,only: [:index, :show, :new, :create]
  resource :session
end
