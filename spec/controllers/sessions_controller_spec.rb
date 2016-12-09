require 'rails_helper'

describe SessionsController do
  describe '#new' do
    before(:each) { get :new }

    it 'sets credentials to an empty hash' do
      expect(assigns(:credentials)).to be_a Hash
    end

    it 'sets trigger_modal to false' do
      expect(assigns(:trigger_modal)).to be false
    end
  end

  describe '#create' do
    let!(:existing_user) { create(:user) }

    let(:good_credentials) {
      { username: 'test_user', password: 'test_password' }
    }

    let(:bad_credentials) {
      { username: 'test_user', password: 'password' }
    }

    it 'finds and assigns user instance' do
      post :create, user: good_credentials
      expect(assigns(:user)).to eq existing_user
    end

    context 'when user is found' do
      before(:each) { post :create, user: good_credentials }

      it 'signs in user' do
        expect(session[:session_token]).to be_a String
      end

      it 'redirects to root url' do
        expect(response).to redirect_to :root
      end
    end

    context 'when user is not found' do
      before(:each) { post :create, user: bad_credentials }

      it 'adds error message to flash hash' do
        expect(flash.now[:errors]).to eq ["Invalid username and/or password."]
      end

      it 'updates credentials username value' do
        expect(assigns(:credentials)).to eq({ username: 'test_user' })
      end

      it 'sets trigger_modal to true' do
        expect(assigns(:trigger_modal)).to be true
      end

      it 'renders new user tempalate' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe '#guest_sign_in' do
    let!(:guest_user) { create(:user, :guest) }

    before(:each) do
      post :create, user: { username: 'Guest', password: 'GuestPassword' }
    end

    it 'assigns user instance to guest user' do
      expect(assigns(:user)).to eq guest_user
    end

    it 'signs in guest user' do
      expect(session[:session_token]).to be_a String
    end

    it 'redirects to root url' do
      expect(response).to redirect_to :root
    end
  end

  # describe '#destroy' do
  #   it 'signs out user' do
  #     # expect(session[:session_token]).to be_nil
  #   end
  #
  #   it 'redirects to new session url' do
  #     # expect(response).to redirect_to :new_session
  #   end
  # end
end
