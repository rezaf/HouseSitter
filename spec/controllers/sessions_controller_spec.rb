require 'rails_helper'

describe SessionsController do
  describe '#new' do
    it 'sets credentials to an empty hash'
    it 'sets trigger_modal to false'
  end

  describe '#create' do
    it 'finds and assigns user instance'

    context 'when user is found' do
      it 'signs in user'
      it 'redirects to root url'
    end

    context 'when user is not found' do
      it 'adds error message to flash hash'
      it 'updates credentials username value'
      it 'sets trigger_modal to true'
      it 'renders new user tempalate'
    end
  end

  describe '#guest_sign_in' do
    it 'assigns user instance to guest user'
    it 'signs in guest user'
    it 'redirects to root url'
  end

  describe '#destroy' do
    it 'signs out user'
    it 'redirects to new session url'
  end
end
