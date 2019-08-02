class UsersController < ApplicationController
    # before_action :find_user, only: [:show]
    def new
        @user = User.new
    end

    def create
        #byebug
        @user=User.new(user_params)
        if @user.save
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show #use current_user
        @user = User.find_by(id: params[:id])
        if current_user.nil?
            redirect_to login_path
        end
        if current_user 
            if @user.nil? || @user.id != current_user.id
            @artists = current_user.artists 
            @venues = current_user.venues
            redirect_to user_path(current_user)
            end
        end
        @booking = Booking.new
    end

    def index
        @users = User.all
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

    # def find_user
    #     @user = User.find_by(id: params[:id])
    # end
end
