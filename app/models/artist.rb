class Artist < ApplicationRecord
    has_many :bookings
    has_many :genres
    has_many :posts
    has_many :venues, through: :bookings
    has_many :artist_likes
    
end
