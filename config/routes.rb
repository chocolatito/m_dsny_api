Rails.application.routes.draw do
  resources :casts
  resources :characters
  resources :movies
  resources :genres
  resources :users, param: :_email
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
