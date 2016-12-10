require 'rails_helper'

describe Api::ListingsController do
  let!(:current_user) { create(:user, :guest) }
  let!(:all_listings) { create_list(:listing, 3) }

  before(:each) { session[:session_token] = current_user.session_token }

  describe 'GET index' do
    before(:each) { get :index }

    it 'sets listings to all listing records' do
      expect(assigns(:listings)).to eq all_listings
    end

    it 'renders listings as json' do
      expect(response.content_type).to eq 'application/json'
      expect(JSON.parse(response.body).length).to be 3
    end
  end

  describe 'GET show' do
    it 'finds and sets listing based on ID' do
      get :show, id: all_listings.first.id
      expect(assigns(:listing)).to eq all_listings.first
    end

    context 'when listing ID is found' do
      it 'renders listing json' do
        get :show, id: all_listings.first.id
        expect(response.body).to eq all_listings.first.to_json
      end
    end

    context 'when listing ID is not found' do
      it 'renders response with unprocessable_entity status' do
        get :show, id: 0
        expect(response.status).to be 422
      end
    end
  end

  describe 'POST create' do
    it 'initializes new listing' do
      post :create, listing: {
        title: 'New Listing',
        description: 'New listing test description',
        user_id: 1
      }

      expect(assigns(:listing)).to eq Listing.last
    end

    context 'when listing sucessfully saves' do
      it 'renders listing json' do
        post :create, listing: {
          title: 'New Listing',
          description: 'New listing test description',
          user_id: 1
        }

        expect(response.body).to eq Listing.last.to_json
      end
    end

    context 'when listing does not sucessfully save' do
      it 'renders error message json with unprocessable_entity status' do
        post :create, listing: {
          title: 'New Listing',
          user_id: 1
        }

        expect(response.body).to eq ["Description can't be blank"].to_json
        expect(response.status).to be 422
      end
    end
  end

  describe 'PUT update' do
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

  describe 'DELETE destroy' do
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
