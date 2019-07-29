class Artist < ApplicationRecord
    has_many :bookings
    has_many :artist_genres
    has_many :genres, through: :artist_genres
    has_many :posts
    has_many :venues, through: :bookings
    has_many :artist_likes
    has_many :venues, through: :artist_likes

end
