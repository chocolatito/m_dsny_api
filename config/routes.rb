Rails.application.routes.draw do
  resources :casts
  resources :characters
  resources :movies
  resources :genres
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, param: :_email
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
  
end
