require 'rails_helper'

describe Listing do
  describe 'validations' do
    it 'validates title for presence' do
      listing = described_class.new(description: 'description', user_id: 1)
      expect(listing).not_to be_valid
    end

    it 'validates description for presence' do
      listing = described_class.new(title: 'title', user_id: 1)
      expect(listing).not_to be_valid
    end

    it 'validates user_id for presence' do
      listing = described_class.new(title: 'title', description: 'description')
      expect(listing).not_to be_valid
    end

    it 'validates start date not later than end date' do
      listing = described_class.new(
        title: 'title',
        description: 'description',
        user_id: 1,
        start_date: Date.tomorrow,
        end_date: Date.today
      )

      expect(listing).not_to be_valid
    end

    it 'passes validations for valid listing' do
      listing = described_class.new(
        title: 'title',
        description: 'description',
        user_id: 1
      )

      expect(listing).to be_valid
    end
  end
end
