class ArtistsController < ApplicationController
    before_action :find_artist, only: [:show, :edit, :update, :destroy]

    def index
        @artists = Artist.all
    end

    def show 
        @bookings = @artist.bookings
        @post = Post.new
        @venues = @artist.venues
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
            UserArtist.create(user: current_user, artist: @artist)
            redirect_to artist_path(@artist)
        else
            render :new
        end
    end

    def edit
        require_login
    end

    def update
        if @artist.update(artist_params)
            @artist.save
            redirect_to artist_path(@artist)
        else
            render :edit
        end
    end

    def destroy
        #byebug
        artist = Artist.find_by(id: params[:id])
        user = artist.user
        artist.destroy
        if user
            redirect_to user_path(user) #problem happens when a user wants to delete an artist that they do not own (since the option is currently exposed to them)
        else
            redirect_to artists_path
        end
    end

    private

    def find_artist
        @artist = Artist.find(params[:id])
    end

    def artist_params
        params.require(:artist).permit(:name, :description, :image_url, :avatar, genre_ids: [], genres_attributes: [:name])
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end

