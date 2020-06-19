Rails.application.routes.draw do

  devise_for :users
  
  root to: 'users#index'

  # resources :users, only: [:index, :show]
  resources :movies, only: [:index, :create]
  resources :ratings, only: [:create]
  resources :followings, only: [:create, :destroy]

  get '/search' => 'search#search_movie'
  get '/home' => 'users#index', as: :home
  get 'profile/:id' => 'users#show', as: :profile
  get '/feed' => 'users#feed', as: :feed

end
