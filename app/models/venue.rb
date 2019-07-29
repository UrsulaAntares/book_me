class Venue < ApplicationRecord
    has_many :bookings
    has_many :artists, through: :bookings
    has_many :artist_likes

    def future_shows
        self.bookings.select {|b| b.start_date > DateTime.now} 
    end

    def next_show

    end

    def past_shows
        self.bookings.select {|b| b.start_date < DateTime.now}
    end



end
