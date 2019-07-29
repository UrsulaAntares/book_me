class Booking < ApplicationRecord
    belongs_to :artist
    belongs_to :venue


    def datetime_format(datetime)
        datetime.strftime("%A, %B %e, %Y, %I:%M %p")
    end

    def date_format(date)
        date.strftime("%A, %B %e, %Y")
    end

    def time_format(time)
        time.strftime("%I:%M %p")
    end
    
end
