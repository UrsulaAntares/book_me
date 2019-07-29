class Booking < ApplicationRecord
    belongs_to :artist
    belongs_to :venue
   

    def format_time
        "Time: #{self.start_date.strftime("%A, %B %d, %Y at %I:%M %p")} to #{self.end_time.strftime("%I:%M %p")}."
    end

end
