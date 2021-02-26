class BloodSugarDetailsController < ApplicationController
    def new
        @blood_sugar_detail=BloodSugarDetail.new
    end

    def index
        @user = User.find(params[:user_id])
        @blood_sugar_detail=@user.blood_sugar_details.all
        @blood_sugar_detail= @blood_sugar_detail.order(blood_sugar_date: :desc)
        @latest_checkup=@blood_sugar_detail.first[:blood_sugar_date] unless @blood_sugar_detail.empty?
    end

    def create
        @user = User.find(params[:user_id])
        @blood_sugar_detail=@user.blood_sugar_details.new(blood_sugar: params[:blood_sugar_detail][:blood_sugar],blood_sugar_date: params[:blood_sugar_detail][:blood_sugar_date])
        if @blood_sugar_detail.save
            redirect_to @user
        else
            render 'new'
        end
    end

    def destroy
        @user = User.find(params[:user_id])
        @blood_sugar_detail = BloodSugarDetail.find(params[:id])
        @blood_sugar_detail.destroy
        redirect_to show_blood_sugar_url
    end
end