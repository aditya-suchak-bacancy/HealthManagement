class UsersController < ApplicationController
    before_action :authorized ,only: [:show]
    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params)
        if @user.valid?
          @user.save
          redirect_to new_session_path
        else  
          render :new
        end
    end
    
    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to @user
        else
            render :edit
        end
    end

    
    private
    
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation,:name,:last_name,:dob,:gender,:weight,:height)
    end
end

