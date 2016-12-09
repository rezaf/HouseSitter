require 'rails_helper'

describe UsersController do
  describe '#new' do
    it 'returns new user instance' do
      expect(UsersController.new).to be_an_instance_of User
    end
  end

  describe '#create' do
    let(:user) { build(:user) }

    context 'when user is successfuly saved' do
      it 'signs in user'
      it 'redirects to root URL'
    end

    context 'when user is not successfuly saved' do
      it 'adds error message to flash hash'
      it 'render new view'
    end
  end
end
