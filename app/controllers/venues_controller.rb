class VenuesController < ApplicationController

    before_action :find_venue, only: :show

    def show
        @bookings = @venue.bookings
    end

    def index
        @venues = Venue.all
    end

    def new
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

    private

    def find_venue
        @venue = Venue.find(params[:id])
    end
    
    def venue_params

    end

end
