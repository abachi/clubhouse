Rails.application.routes.draw do
  root 'posts#index'

  get '/login', to: 'sessions#new'
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  resources :posts
end
