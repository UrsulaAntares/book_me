class UserArtistsController < ApplicationController

    def new
        @user_artist = UserArtist.new
    end

    def create
        user_object = User.find_by(username: user_artist_params[:user_id])
       # byebug
      
        artist_ids = user_artist_params[:artist_id]
        artist_ids.each do |id|
            if !user_object.nil? && id != "" && !user_object.artists.include?(Artist.find_by(id: id))
                UserArtist.create(user_id: user_object.id, artist_id: id)
            end
        end
        if user_object.nil?
            @user_artist = UserArtist.new
            @message = "No user found."
            render :new
        else
            redirect_to user_path(current_user)
        end
    end

    def remove
    @artist = Artist.find_by(remove_params[:artist_id])
    end

    def destroy
       # byebug
        user = User.find_by(username: params[:user_id])
       relation = UserArtist.find_by(user_id: user.id, artist_id: destroy_params[:id])
        relation.destroy
        redirect_to user_path(current_user)
    end

    private

    def user_artist_params
        params.require(:user_artist).permit(:user_id, artist_id: [])
    end

    def remove_params
       params.permit(:artist_id)
    end

    def destroy_params
        params.permit(:user, :id)
    end
end
