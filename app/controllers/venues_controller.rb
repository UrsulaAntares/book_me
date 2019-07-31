class VenuesController < ApplicationController

    before_action :find_venue, only: [:show, :edit, :delete, :update]

    def show
        @bookings = @venue.bookings
        @booking = Booking.new
        @artists = @venue.artists
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
            UserVenue.create(user: current_user, venue: @venue)
            redirect_to venue_path(@venue)
        else
            render 'new'
        end
    end

    def edit
        require_login
    end

    
    def update
        if @venue.valid?
            @venue.update(venue_params)
            redirect_to venue_path(@venue)
        else
            render 'edit'
        end
    end
    
    def endorse
        venue = Venue.find(venue_params[:venue_id])
        artist = Artist.find_by(name: venue_params[:artist_name])
        like = venue.artist_likes.build(artist: artist)
        like.save
        redirect_to venue_path(venue)
    end

    def unendorse
        venue = Venue.find(venue_params[:venue_id])
        artist = Artist.find_by(name: venue_params[:artist_name])
        likes = venue.artist_likes.select { |al| al.artist_id == artist.id }
        likes.each {|l| l.delete }
        redirect_to venue_path(venue)
    end


    private

    def find_venue
        @venue = Venue.find(params[:id])
    end
    
    def venue_params
        params.require(:venue).permit(:name, :location, :category, :capacity, :description, :artist_name, :venue_id)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

end
