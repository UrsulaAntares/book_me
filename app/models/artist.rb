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
    has_one :user_artist
    has_one :user, through: :user_artist
    

end
