class ArtistsController < ApplicationController
    before_action :find_artist, only: [:show, :edit]

    def index
        @artists = Artist.all
    end

    def show 
        @bookings = @artist.bookings
    end

    def new
        @artist = Artist.new
        @artist.genres.build()
    end

    def create
        #byebug
        @artist = Artist.new(artist_params)
        if @artist.save
            @artist.save
            redirect_to artist_path(@artist)
        else
            render :new
        end
    end

    def edit
    end

    def update
    end

    private

    def find_artist
        @artist = Artist.find(params[:id])
    end

    def artist_params
        params.require(:artist).permit(:name, :description, :image_url, :avatar, genre_ids: [], genres_attributes: [:name])
    end
end
