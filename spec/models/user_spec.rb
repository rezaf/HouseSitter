require 'rails_helper'

describe User do
  let!(:user) { create(:user) }

  describe '.find_by_credentials' do
    it "returns correct user with matching username" do
      expect(User.find_by_credentials('test_user', 'test_password')).to eq(user)
    end

    it "returns nil if username does not match a user" do
      expect(User.find_by_credentials('test', 'test_password')).to be_nil
    end

    it "returns nil if password is not valid for user" do
      expect(User.find_by_credentials('test_user', 'password')).to be_nil
    end
  end

  describe '#password=' do
    it "sets password digest" do
      expect(user.password_digest.length).to be > 0
      expect(user.password_digest).to be_a String
    end
  end

  describe '#valid_password?' do
    it "returns true if password is valid" do
      expect(user.valid_password?('test_password')).to be true
    end

    it "returns false if password if not valid" do
      expect(user.valid_password?('test_passsword')).to be false
    end
  end

  describe '#reset_session_token!' do
    it "generates and saves a new session token" do
      original_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).not_to eq original_token
    end

    it "returns the newly-generated session token" do
      expect(user.reset_session_token!.length).to be > 0
      expect(user.reset_session_token!).to be_a String
    end
  end
end
