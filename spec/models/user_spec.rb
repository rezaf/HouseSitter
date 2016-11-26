require 'rails_helper'

describe User, type: :model do
  describe '::find_by_credentials' do
    it "returns correct user with matching username"
    it "returns nil if username does not match a user"
    it "returns nil if password is not valid for user"
  end

  describe '#password=' do
    it "sets user password"
    it "returns user password digest"
  end

  describe '#valid_password?' do
    it "returns true if password is valid"
    it "returns false if password if not valid"
  end

  describe '#reset_session_token!' do
    it "generates and saves a new session token"
    it "returns the newly-generated session token"
  end
end
