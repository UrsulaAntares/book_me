class BookingsController < ApplicationController

    before_action :find_booking, only: [:show, :edit, :update, :delete]

    def show
    end
    
    def index
        @bookings = Booking.all
    end
    
    def new
        @booking = Booking.new
        @booking.start_date = DateTime.now.strftime("%Y-%m-%dT%H:%M:00")
        @booking.end_time = DateTime.now.strftime("%Y-%m-%dT%H:%M:00")
    end
 
    def create
        @booking = Booking.new(booking_params)
        if @booking.valid?
            @booking.save
            redirect_to booking_path(@booking)
        else
            render 'new'
        end
    end

    def edit
    end


    def update
        if @booking.update(booking_params)
            redirect_to booking_path(@booking)
        else
            render 'edit'
        end
    end


    private

    def find_booking
        @booking = Booking.find(params[:id])
    end

    def booking_params
        params.require(:booking).permit(:start_date, :end_time, :artist_name, 
            :venue_name, :description, :title, :image_url)
    end

end


