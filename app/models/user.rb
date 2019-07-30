class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    has_many :user_artists
    has_many :artists, through: :user_artists
    has_many :user_venues
    has_many :venues, through: :user_venues
end
