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
        if @user.id != current_user.id
            redirect_to user_path(current_user)
        end
        @artists = @user.artists 
        # current_user.artists
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

    # def find_user
    #     @user = User.find_by(id: params[:id])
    # end
end
