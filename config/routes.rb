Rails.application.routes.draw do
  resources :artist_genres
  resources :artist_likes
  resources :genres
  resources :bookings
  resources :posts
  resources :venues
  resources :artists
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
