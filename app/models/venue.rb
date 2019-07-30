class Venue < ApplicationRecord
    has_many :bookings
    has_many :artists, through: :bookings
    has_many :artist_likes
    has_one :user_venue
    has_one :user, through: :user_venue

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
