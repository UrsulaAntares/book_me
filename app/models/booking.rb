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
        time.strftime("%I:%M %p")
    end

    def date
        self.start_date.to_date
    end
    
end
