require 'rails_helper'

RSpec.describe "BloodPressureDetails", type: :request do
	let (:user) {create(:user)}
	let (:blood_pressure_detail) {create(:blood_pressure_detail)}

  describe 'GET blood_pressure_details#index' do
		context 'Get Blood Pressure' do
			it 'Get index' do
				get "/user/#{user.id}/index_pressure"
				expect(response).to render_template :index_pressure
			end
		end
	end

	describe 'GET #new' do

    it 'New BloodPressure' do
      get "/user/#{user.id}/new_pressure"
      expect(response).to have_http_status(:success)
    end
  end

	describe 'POST blood_pressure_details#create' do
		context 'with valid params' do
			it 'Create New BloodPressure' do
				expect{
          post "/user/#{user.id}/new_pressure" , params: {
                    blood_pressure_detail: attributes_for(:blood_pressure_detail)
                  }}.to change(BloodPressureDetail,:count).by(1)
			end
		end

		context 'with invalid params' do
			it 'Do Not Create New Blood Pressure' do
				expect{
          post "/user/#{user.id}/new_pressure", params: {
                      :blood_pressure_detail => {
                        :s_blood_pressure => '',:d_blood_pressure => '',:blood_sugar_date => ''
                      }
                  }
				}.not_to change(BloodPressureDetail,:count)
			end
		end
	end

	describe 'Delete blood_Pressure_detail#destroy' do
    context 'with valid params' do
      let(:delete_blood_pressure) do
        delete "/user/#{user.id}/index_pressure", params: { id: blood_pressure_detail.id }
      end

      it { expect { delete_blood_pressure }.to change(BloodPressureDetail, :count).by(0) }
    end

  end

end
