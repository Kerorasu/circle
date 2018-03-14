Rails.application.routes.draw do
  root 'clubs#index'
  devise_for :clubs
  resources :clubs
  get 'search' => 'clubs#search'
end
