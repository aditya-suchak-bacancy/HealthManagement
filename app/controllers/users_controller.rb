class UsersController < ApplicationController
   # before_action :authorized ,only: [:show]

    def index
    end
    
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
        unless @user.reminds.empty?
            if @user.reminds.last[:remind_date] == Date.today
                flash[:notice] = "you have a checkup for #{@user.reminds.first[:remid_type]} today"
            end
        end
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

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        redirect_to root_path
    end

    private
    
    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation,:name,:last_name,:dob,:gender,:weight,:height)
    end
end