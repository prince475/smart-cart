Rails.application.routes.draw do

  get 'users', to: 'users#index'
  post 'register', to: 'users#create'
  post 'login', to: 'auths#create'

  get 'products', to: 'products#index'
  post 'product', to: 'products#create'

end
