class BloodPressureDetailsController < ApplicationController
    def new_pressure
    end

    def index_pressure
        @user = User.find(params[:user_id])
        @blood_pressure_detail=@user.blood_pressure_details.all
        @blood_pressure_detail= @blood_pressure_detail.order(blood_pressure_date: :desc)
        @latest_checkup=@blood_pressure_detail.first[:blood_pressure_date]
    end

    def create_pressure
        @user = User.find(params[:user_id])
        #byebug
        @blood_pressure_detail=@user.blood_pressure_details.create(s_blood_pressure: params[:s_blood_pressure],d_blood_pressure: params[:d_blood_pressure],blood_pressure_date: params[:blood_pressure_date])
        @blood_pressure_detail.save
        redirect_to @user
    end

    def destroy
        @user = User.find(params[:user_id])
        @blood_pressure_detail = BloodPressureDetail.find(params[:id])
        @blood_pressure_detail.destroy
        redirect_to show_blood_pressure_url
    end

    private

    def blood_pressure_params
        params.require(:blood_pressure_detail).permit(:s_blood_pressure,:d_blood_pressure,:blood_pressure_date)
    end
end
