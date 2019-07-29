class ArtistsController < ApplicationController
    before_action :find_artist, only: [:show, :edit]

    def index
        @artists = Artist.all
    end

    def show 
        
    end

    def new
        @artist = Artist.new
    end

    def create
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
        params.require(:artist).permit(:name, :description, :image_url, genres: [])
    end
end
