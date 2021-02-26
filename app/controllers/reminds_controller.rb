class RemindsController < ApplicationController
    def new_remind
        @remind = Remind.new
    end

    def create_remind
        @user = User.find(params[:user_id])
        @remind = @user.reminds.new(remid_type: params[:remid_type],remind_date: params[:remind_date])
        if @remind.save
            redirect_to @user
        else
            render 'new_remind'
        end
    end

    def index_remind
        @user = User.find(params[:user_id])
        @remind = @user.reminds.all
        @remind = @remind.order(remind_date: :asc)
        @upcoming = @remind.first[:remind_date] unless @remind.empty?
    end

    def destroy
        @user = User.find(params[:user_id])
        @remind = Remind.find(params[:id])
        @remind.destroy
        redirect_to show_remind_url
    end
end
