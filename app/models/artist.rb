class Artist < ApplicationRecord
    has_many :bookings
    has_many :artist_genres
    has_many :genres, through: :artist_genres
    accepts_nested_attributes_for :genres
    has_many :posts
    has_many :venues, through: :bookings
    has_many :artist_likes
    has_many :venues, through: :artist_likes
    has_one_attached :avatar
    validates :name, presence: true
    has_many :user_artists
    has_many :users, through: :user_artists
    

end
