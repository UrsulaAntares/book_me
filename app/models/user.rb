class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: true
    has_many :user_artists
    has_many :artists, through: :user_artists
    has_many :user_venues
    has_many :venues, through: :user_venues
    has_many :posts, through: :artists
    has_many :user_likes_artists
    # has_many :artists, through: :user_likes_artists #it remains to be seen what impact this will have on user.artists as set through admin


    def other_users
        User.all.select do |user|
            user != self
        end
    end
end
