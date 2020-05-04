Rails.application.routes.draw do

  root to: 'users#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :movies, only: [:index, :create]
  resources :ratings, only: [:create]
  resources :followings, only: [:create, :destroy]

  get '/search' => 'search#search_movie'

end
