require 'rails_helper'

describe Api::ListingsController do
  describe '#index' do
    let!(:current_user) { create(:user, :guest) }
    let!(:all_listings) { create_list(:listing, 3) }

    before(:each) do
      session[:session_token] = current_user.session_token
      get :index
    end

    it 'sets listings to all listing records' do
      expect(assigns(:listings)).to eq all_listings
    end

    it 'renders listings as json' do
      expect(response.content_type).to eq 'application/json'
      expect(JSON.parse(response.body).length).to be 3
    end
  end

  describe '#show' do
    it 'sets listing based on ID' do

    end

    context 'when listing is found' do
      it 'renders listing json' do

      end
    end

    context 'when listing is not found' do
      it 'renders error message json' do

      end
    end
  end

  describe '#create' do
    it 'initializes new listing' do

    end

    context 'when listing sucessfully saves' do
      it 'renders listing json' do

      end
    end

    context 'when listing does not sucessfully save' do
      it 'renders error message json' do

      end
    end
  end

  describe '#update' do
    it 'sets listing based on ID' do

    end

    context 'when listing sucessfully updates' do
      it 'renders listing json' do

      end
    end

    context 'when listing does not sucessfully update' do
      it 'renders error message json' do

      end
    end
  end

  describe '#destroy' do
    it 'sets listing based on ID' do

    end

    context 'when listing sucessfully destroyed' do
      it 'renders destroyed message' do

      end
    end

    context 'when listing does not sucessfully destroy' do
      it 'renders error message json' do

      end
    end
  end
end
