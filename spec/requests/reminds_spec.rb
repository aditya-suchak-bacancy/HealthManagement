require 'rails_helper'

RSpec.describe "Reminds", type: :request do
 
  let (:user) {create(:user)}
	let (:remind) {create(:remind)}

  describe 'GET #index' do 
		context 'Get Blood Sugar' do
			it 'Get index' do
				get "/user/#{user.id}/index_remind"
				expect(response).to render_template :index_remind
			end
		end
	end

	describe 'GET #new' do

    it 'New Remind' do
      get "/user/#{user.id}/new_remind"
      expect(response).to have_http_status(:success)
    end
  end

	describe 'POST #create' do
		context 'with valid params' do
			it 'Create New Remind' do
				expect{
          post "/user/#{user.id}/new_remind" , params: {
                    remind: attributes_for(:remind)
                  }}.to change(Remind,:count).by(0)
			end
		end

		context 'with invalid params' do
			it 'Do Not Create New Remind' do
				expect{
          post "/user/#{user.id}/new_remind", params: {
                      :remind => {
                        :remid_type => '', :remind_date => ''
                      }
                  }
				}.not_to change(Remind,:count)
			end
		end
	end

	describe '#destroy' do
    context 'with valid params' do
      let(:delete_remind) do
        delete "/user/#{user.id}/index_remind", params: { id: remind.id }
      end

      it { expect { delete_remind }.to change(Remind, :count).by(0) }
    end

  end

end
