Rails.application.routes.draw do
  root 'clubs#index'
  devise_for :clubs
  resources :clubs
  get 'search' => 'clubs#search'
  get 'get_small_genre' => 'clubs#get_small_genre'
end
