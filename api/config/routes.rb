Rails.application.routes.draw do

  get 'users', to: 'users#index'
  post 'register', to: 'users#create'
  post 'login', to: 'auth#create'

end
