class Booking < ApplicationRecord
    extend SimpleCalendar
    # has_calendar 
    belongs_to :artist
    belongs_to :venue
   

    def format_time
        "Time: #{self.start_date.strftime("%A, %B %d, %Y at %I:%M %p")} to #{self.end_time.strftime("%I:%M %p")}."
    end



    def datetime_format(datetime)
        datetime.strftime("%A, %B %e, %Y, %I:%M %p")
    end

    def date_format(date)
        date.strftime("%A, %B %e, %Y")
    end

    def time_format(time)
        time.strftime("%l:%M %p")
    end

    def time
        "#{time_format(self.start_date)} - #{time_format(self.end_time)}"
    end

    def date
        self.start_date.to_date
    end

    def artist_name
        self.artist ? self.artist.name : nil
    end

    def artist_name=(name)
        self.artist = Artist.find_by(name: name)
    end
    
    def venue_name
        self.venue ? self.venue.name : nil    
    end

    def venue_name=(name)
        self.venue = Venue.find_by(name: name)
    end

end
