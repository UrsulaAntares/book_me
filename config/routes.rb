Rails.application.routes.draw do
  resources :user_venues
  resources :user_artists
  resources :users
  resources :artist_genres
  resources :artist_likes
  resources :genres
  resources :bookings
  resources :posts
  # get '/posts/new/:artist_id', to: 'posts#new', as: 'posts/new'
  # post '/posts/new/:artist_id', to: 'posts#create'
  resources :venues
  resources :artists
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/home', to: 'static#home'
  post '/venues/endorse', to: 'venues#endorse'
  post '/venues/unendorse', to: 'venues#unendorse'
  post '/artists/like', to: 'artists#like'
  get '/artists/like', to: 'artists#like'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
