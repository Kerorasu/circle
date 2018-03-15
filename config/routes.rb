Rails.application.routes.draw do
  root 'clubs#index'
  devise_for :clubs, :controllers => {
    :registrations => "clubs/registrations"
  }
  resources :clubs
  get 'search' => 'clubs#search'
  get 'get_small_genre_search' => 'clubs#get_small_genre_search'
  get 'get_small_genre_form' => 'clubs#get_small_genre_form'
end
