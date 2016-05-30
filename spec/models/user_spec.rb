require 'rails_helper'

describe User, type: :model do
  describe '::find_by_credentials' do
    it "returns correct user with matching username"
    it "returns nil if username does not match a user"
    it "returns nil if password is not valid for user"
  end

  describe '#password=' do
    
  end

  describe '#valid_password?' do

  end

  describe '#reset_session_token!' do

  end
end
