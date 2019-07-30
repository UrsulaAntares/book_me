Rails.application.routes.draw do
  resources :users
  resources :artist_genres
  resources :artist_likes
  resources :genres
  resources :bookings
  resources :posts
  resources :venues
  resources :artists
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
