class Venue < ApplicationRecord
    has_many :bookings
    has_many :artists, through: :bookings
    has_many :artist_likes
    has_many :user_venues
    has_many :users, through: :user_venues
    has_one_attached :picture

    def future_shows
        self.bookings.select {|b| b.start_date > DateTime.now} 
    end

    def next_show

    end

    def past_shows
        self.bookings.select {|b| b.start_date < DateTime.now}
    end

    def nice_description
        if self.description
            self.description.humanize
        end
    end

end
