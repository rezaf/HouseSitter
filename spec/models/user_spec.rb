require 'rails_helper'

describe User do
  let!(:user) { create(:user) }

  describe 'validations' do
    it 'validates username for presence' do
      invalid_user = described_class.new(email: 'user@email.com', password: 'password')
      expect(invalid_user).not_to be_valid
    end

    it 'validates email for presence' do
      invalid_user = described_class.new(username: 'user', password: 'password')
      expect(invalid_user).not_to be_valid
    end

    it 'validates password for minimum length' do
      invalid_user = described_class.new(
        username: 'user',
        email: 'email@email.com',
        password: 'pass'
      )

      expect(invalid_user).not_to be_valid
    end

    it 'allows nil value for password' do
      nil_password_user = described_class.new(
        username: 'user',
        email: 'email@email.com',
        password: nil
      )

      expect(nil_password_user).to be_valid
    end

    it 'validates username for uniqueness' do
      invalid_user = described_class.new(
        username: 'test_user',
        email: 'email@email.com',
        password: 'password'
      )

      expect(invalid_user).not_to be_valid
    end

    it 'validates email for uniqueness' do
      invalid_user = described_class.new(
        username: 'user',
        email: 'test@example.com',
        password: 'password'
      )

      expect(invalid_user).not_to be_valid
    end

    it 'passes all validations for a valid user' do
      expect(user).to be_valid
    end
  end

  describe '.find_by_credentials' do
    it "returns correct user when credentials match" do
      expect(described_class.find_by_credentials('test_user', 'test_password'))
        .to eq(user)
    end

    it "returns nil if username does not match a user" do
      expect(described_class.find_by_credentials('test', 'test_password'))
        .to be_nil
    end

    it "returns nil if password is not valid for user" do
      expect(described_class.find_by_credentials('test_user', 'password'))
        .to be_nil
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
      expect(user.reset_session_token!).not_to eq original_token
    end

    it "returns the newly-generated session token" do
      expect(user.reset_session_token!.length).to be > 0
      expect(user.reset_session_token!).to be_a String
    end
  end
end
