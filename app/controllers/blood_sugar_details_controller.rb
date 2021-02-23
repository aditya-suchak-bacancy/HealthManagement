class BloodSugarDetailsController < ApplicationController
    def new
    end

    def index
        @user = User.find(params[:user_id])
        @blood_sugar_detail=@user.blood_sugar_details.all
    end

    def create
        @user = User.find(params[:user_id])
        @blood_sugar_detail=@user.blood_sugar_details.create(blood_sugar: params[:blood_sugar],blood_sugar_date: params[:blood_sugar_date])
        # @user.blood_sugar_detail @blood_sugar_detail
        @blood_sugar_detail.save
        redirect_to @user
    end

    def destroy
        #byebug
        @user = User.find(params[:user_id])
        @blood_sugar_detail = BloodSugarDetail.find(params[:id])
        @blood_sugar_detail.destroy
        redirect_to show_blood_sugar_url
    end

    private  

    def blood_sugar_params
        params.require(:blood_sugar_detail).permit(:blood_sugar,:blood_sugar_date)
    end
end
