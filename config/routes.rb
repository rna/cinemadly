Rails.application.routes.draw do

  root to: 'users#index'

  devise_for :users

  resources :users, only: [:index, :show]
  get '/search' => 'search#search_movie'

end
