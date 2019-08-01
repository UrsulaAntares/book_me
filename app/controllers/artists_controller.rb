class ArtistsController < ApplicationController
    before_action :find_artist, only: [:show, :edit, :update, :destroy]

    def index
        @artists = Artist.all
    end

    def search
        @artists = []
        if search_params[:g] != ""
            genre = Genre.find_by(name: search_params[:g])
            @artists = genre.artists
            if @artists == []
                @artists = Artist.all
                @message = "There are no artists by that genre."
            end
        end
        if search_params[:q] != ""
            artist = Artist.find_by(name: search_params[:q])
            if !artist.nil? 
            # if !@artists.include?(artist)
                @artists << artist
            # end
            end
            @artists.uniq
        end
        if @artists.nil? || @artists.empty?
            @artists = Artist.all
            @message = "No artists by that search."
        end
        render :index
    end

    def show 
        @bookings = @artist.bookings
        @post = Post.new
        # @venues = @artist.venues #@artist.venues refers to endorsements 
        @venues = @bookings.map {|b| b.venue }
        @posts = @artist.posts
    end

    def new
        @artist = Artist.new
        @artist.genres.build()
    end

    def like
        @artist = Artist.find(like_params[:artist_id])
        UserLikesArtist.create(user_id: current_user.id, artist_id: @artist.id)
        redirect_to artist_path(@artist)
    end

    def create
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
        artist = Artist.find_by(id: params[:id])
        artist.destroy
        if user
            redirect_to user_path(user) 
        else
            redirect_to artists_path
        end
    end

    def posts
    end

    private

    def find_artist
        @artist = Artist.find(params[:id])
    end

    def artist_params
        params.require(:artist).permit(:name, :description, :image_url, :avatar, genre_ids: [], genres_attributes: [:name])
    end

    def  like_params
        params.permit(:artist_id)
    end    

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end

    def search_params
        params.permit(:q, :g)
    end
end

