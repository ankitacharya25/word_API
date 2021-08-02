Rails.application.routes.draw do
  resources :apikeys
  resources :related_words
  resources :examples
  resources :definitions
  resources :words do 
    get '/definitions', to: 'definitions#show'
    get '/examples', to: 'examples#show'
    get '/related_words', to: 'related_words#show'
  end 
  get 'word/randomWord(:api_key)', to: 'words#show'
  resources :users
  root 'home#index'
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end