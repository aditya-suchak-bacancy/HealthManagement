require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:user) { create(:user) }

  describe 'GET #new' do
    it 'New User' do
      get '/users/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST users#create' do
		context 'with valid params' do
			it 'Create New User' do
				expect{
          post '/users' , params: {
                    user: attributes_for(:user)
                  }}.to change(User,:count).by(1)
			end
		end

		context 'with invalid params' do
			it 'Do Not Create New Task' do
				expect{
          post '/users', params: {
                      :user => {
                        :username =>'', :password =>'', :password_confirmation =>'',:name =>'',:last_name =>'',:dob =>'',:gender =>'',:weight =>'',:height =>''
                      }
                  }
				}.not_to change(User,:count)
			end
		end
	end

  describe 'GET users#show' do
		context 'with valid params' do
			it 'Show User' do
				expect{
          get "/users/#{user.id}" , params: {
                    user: attributes_for(:user)
                  }}.to change(User,:count).by(1)
			end
		end
	end

  describe 'PATCH users#edit' do
    it 'renders the edit page user' do
      get "/users/#{user.id}/edit", params: { id: user.id,
                                                 user: attributes_for(:user) }
      expect(response).to render_template :edit
    end
  end

  describe 'Delete users#destroy' do
    context 'with valid params' do
      let(:delete_user) do
        delete "/users/#{user.id}", params: { id: user.id }
      end

      it { expect { delete_user }.to change(User, :count).by(0) }
    end

    context 'with invalid valid params' do
      let(:delete_user) do
        delete "/users/#{user.id}", params: { id: '' }
      end

      it { expect { delete_user }.not_to change(User, :count) }
    end
  end

  describe 'PUT users#update' do
    let(:new_attributes) do
      attributes_for(:user)
    end

    let(:user) { create(:user) }

    context 'with valid params' do
      it 'updates the user' do
        put "/users/#{user.id}", params: { id: user.id, user: new_attributes }
        expect(user.reload)
      end

      it 'redirects to the index page' do
        put "/users/#{user.id}", params: { id: user.id, user: new_attributes }
        expect(response).to redirect_to user_path
      end
    end

    context 'with invalid params' do
       
      before do
        put "/users/#{user.id}", params: {
          :user => {
            :username =>'', :password =>'', :password_confirmation =>'',:name =>'',:last_name =>'',:dob =>'',:gender =>'',:weight =>'',:height =>''
          }
      }
      end

      it 'updates the user' do
        user.reload
        expect(user.password).not_to eq ''
      end

      it 'renders the edit page' do
        expect(response).to render_template :edit
      end
    end
  end
end
