Rails.application.routes.draw do
  get 'users/new'
  post 'users', to: 'users#create'
  get 'posts/new'
  post 'posts', to: 'posts#create'
  get 'posts/', to: 'posts#index'
  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signin', to: 'sessions#delete'

  root to: 'posts#index'
end
