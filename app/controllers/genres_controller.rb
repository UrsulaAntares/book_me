class GenresController < ApplicationController

    before_action :find_genre, only: :show

    def index
        @genres = Genre.all
        @booking = Booking.new
    end

    def show
        @artists = @genre.artists
        @booking = Booking.new
    end

    private

    def find_genre
        @genre = Genre.find(params[:id])
    end

end
