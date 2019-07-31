class Genre < ApplicationRecord
    has_many :artist_genres
    has_many :artists, through: :artist_genres
    validates :name, uniqueness: true
 
end