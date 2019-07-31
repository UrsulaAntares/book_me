class ArtistsController < ApplicationController
    before_action :find_artist, only: [:show, :edit, :update, :destroy]

    def index
        @artists = Artist.all
    end

    def search
        #byebug
        @artists = []
        if search_params[:g] != ""
        genre = Genre.find_by(name: search_params[:g])
        #byebug
        @artists = genre.artists
        if @artists == []
            @artists = Artist.all
            @message = "There are no artists by that genre."
        end
    end
        #byebug
        if search_params[:q] != ""
        artist = Artist.find_by(name: search_params[:q])
        #byebug
        if !artist.nil? 
        # if !@artists.include?(artist)
            @artists << artist
        # end
        # byebug
    end
            @artists.uniq
    end
    #byebug
    if @artists.nil? || @artists.empty?
        @artists = Artist.all
        @message = "No artists by that search."
    end
        render :index
        
    end

    def show 
        @bookings = @artist.bookings
        @post = Post.new
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

    def search_params
        params.permit(:q, :g)
    end
end

