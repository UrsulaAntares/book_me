class VenuesController < ApplicationController

    before_action :find_venue, only: [:show, :edit, :delete, :update]

    def show
        @bookings = @venue.bookings
    end

    def index
        @venues = Venue.all
    end

    def new
        @venue = Venue.new
    end

    def create
        @venue = Venue.new(venue_params)
        if @venue.valid?
            @venue.save
            redirect_to venue_path(@venue)
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @venue.valid?
            @venue.update(venue_params)
            redirect_to venue_path(@venue)
        else
            render 'edit'
        end
    end




    private

    def find_venue
        @venue = Venue.find(params[:id])
    end
    
    def venue_params
        params.require(:venue).permit(:name, :location, :category, :capacity, :description)
    end

end
