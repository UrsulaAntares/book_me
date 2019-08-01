class UserVenuesController < ApplicationController

    def new
        @user_venue = UserVenue.new
    end

    def create
        user_object = User.find_by(username: user_venue_params[:user_id])
        venue_ids = user_venue_params[:venue_id]
        venue_ids.each do |id|
            if id != "" && !user_object.venues.include?(Venue.find_by(id: id))
                UserVenue.create(user_id: user_object.id, venue_id: id)
            end
        end
        redirect_to user_path(current_user)
    end

    def remove
        @venue = Venue.find_by(id: remove_params[:venue_id])
    end


    def destroy
        #byebug
        user = User.find_by(username: params[:user_id])
       relation = UserVenue.find_by(user_id: user.id, venue_id: destroy_params[:id])
        relation.destroy
        redirect_to user_path(current_user)
    end

    private

    def user_venue_params
        params.require(:user_venue).permit(:user_id, venue_id: [])
    end

    def remove_params
        params.permit(:venue_id)
    end

    def destroy_params
        params.permit(:user, :id)
    end
        

end
