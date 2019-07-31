class UserArtistsController < ApplicationController

    def new
        @user_artist = UserArtist.new
    end

    def create
        user = user_artist_params[:user_id]
        user_object = User.find_by(id: user)
        artist_ids = user_artist_params[:artist_id]
        artist_ids.each do |id|
            if id != "" && !user_object.artists.include?(Artist.find_by(id: id))
                UserArtist.create(user_id: user, artist_id: id)
            end
        end
            redirect_to user_path(current_user)
    end

    private

    def user_artist_params
        params.require(:user_artist).permit(:user_id, artist_id: [])
    end
end
