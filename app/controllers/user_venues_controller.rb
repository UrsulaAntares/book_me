class UserVenuesController < ApplicationController

    def new
        @user_venue = UserVenue.new
    end

    def create
        user = user_venue_params[:user_id]
        user_object = User.find_by(id: user)
        venue_ids = user_venue_params[:venue_id]
        venue_ids.each do |id|
            if id != "" && !user_object.venues.include?(Venue.find_by(id: id))
                UserVenue.create(user_id: user, venue_id: id)
            end
        end
        redirect_to user_path(current_user)
    end

    private

    def user_venue_params
        params.require(:user_venue).permit(:user_id, venue_id: [])
    end

end
