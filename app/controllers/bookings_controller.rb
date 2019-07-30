class BookingsController < ApplicationController

    before_action :find_booking, only: [:show, :edit, :update, :delete]

    def show
    end
    
    def index
        @bookings = Booking.all
    end
    
    def new
        @booking = Booking.new
        @booking.start_date = DateTime.now
    end
 
    def create
        @booking = Booking.new(booking_params)
        @booking.artist = Artist.find_by(name: booking_params[:artist_id])
        if @booking.valid?
            @booking.save
            redirect_to booking_path(@booking)
        else
            render 'new'
        end
    end

    private

    def find_booking
        @booking = Booking.find(params[:id])
    end

    def booking_params
        params.require(:booking).permit(:start_date, :end_time, :artist_id, :venue_id, :description, :title, :image_url)
    end

end


