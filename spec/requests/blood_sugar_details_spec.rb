require 'rails_helper'

RSpec.describe "BloodSugarDetails", type: :request do
	let (:user) {create(:user)}
	let (:blood_sugar_detail) {create(:blood_sugar_detail)}

  describe 'GET blood_sugar_details#index' do
		context 'Get Blood Sugar' do
			it 'Get index' do
				get "/user/#{user.id}/index"
				expect(response).to render_template :index
			end
		end
	end

	describe 'GET #new' do

    it 'New BloodSugar' do
      get "/user/#{user.id}/new"
      expect(response).to have_http_status(:success)
    end
  end

	describe 'POST blood_sugar_details#create' do
		context 'with valid params' do
			it 'Create New BloodSUgar' do
				expect{
          post "/user/#{user.id}/new" , params: {
                    blood_sugar_detail: attributes_for(:blood_sugar_detail)
                  }}.to change(BloodSugarDetail,:count).by(1)
			end
		end

		context 'with invalid params' do
			it 'Do Not Create New Blood sugar' do
				expect{
          post "/user/#{user.id}/new", params: {
                      :blood_sugar_detail => {
                        :blood_sugar => '', :blood_sugar_date => ''
                      }
                  }
				}.not_to change(BloodSugarDetail,:count)
			end
		end
	end

	describe 'Delete blood_sugar_detail#destroy' do
    context 'with valid params' do
      let(:delete_blood_sugar) do
        delete "/user/#{user.id}/index", params: { id: blood_sugar_detail.id }
      end

      it { expect { delete_blood_sugar }.to change(BloodSugarDetail, :count).by(0) }
    end

    # context 'with invalid params' do
    #   let(:delete_blood_sugar) do
		# 		blood_sugar_detail.user = user
		# 		blood_sugar_detail.save
    #     delete "/user/#{user.id}/index", params: { id: blood_sugar_detail.id }
    #   end
    #   it { expect { delete_blood_sugar }.not_to change(BloodSugarDetail, :count) }
    # end
  end

end
