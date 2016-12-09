require 'rails_helper'

describe UsersController do
  describe '#new' do
    before(:each) { get :new }

    it 'generates new user model instance' do
      expect(assigns(:user)).to be_a_new User
    end

    it 'renders new user template' do
      expect(response).to render_template(:new)
    end
  end

  describe '#create' do
    let(:successful_payload) {
      {
        username: 'username',
        email: 'email@example.com',
        password: 'password'
      }
    }

    let(:unsuccessful_payload) {
      {
        username: 'username',
        password: 'password'
      }
    }

    it 'generates new user model instance' do
      post :create, user: successful_payload
      expect(assigns(:user)).to be_an_instance_of User
    end

    context 'when user is successfuly saved' do
      before(:each) { post :create, user: successful_payload }

      it 'signs in user' do
        expect(session[:session_token]).to be_a String
      end

      it 'redirects to root URL' do
        expect(response).to redirect_to :root
      end
    end

    context 'when user is not successfuly saved' do
      before(:each) { post :create, user: unsuccessful_payload }

      it 'adds error message to flash hash' do
        expect(flash.now[:errors]).to eq ["Email can't be blank"]
      end

      it 'renders new user template' do
        expect(response).to render_template(:new)
      end
    end
  end
end
