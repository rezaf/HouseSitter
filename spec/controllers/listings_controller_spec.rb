require 'rails_helper'

describe API::ListingsController do
  describe '#index' do
    it 'sets listings to all listing records'
    it 'renders listings json'
  end

  describe '#show' do
    it 'sets listing based on ID'

    context 'when listing is found' do
      it 'renders listing json'
    end

    context 'when listing is not found' do
      it 'renders error message json'
    end
  end

  describe '#create' do
    it 'initializes new listing'

    context 'when listing sucessfully saves' do
      it 'renders listing json'
    end

    context 'when listing does not sucessfully save' do
      it 'renders error message json'
    end
  end

  describe '#update' do
    it 'sets listing based on ID'

    context 'when listing sucessfully updates' do
      it 'renders listing json'
    end

    context 'when listing does not sucessfully update' do
      it 'renders error message json'
    end
  end

  describe '#destroy' do
    it 'sets listing based on ID'

    context 'when listing sucessfully destroyed' do
      it 'renders destroyed message'
    end

    context 'when listing does not sucessfully destroy' do
      it 'renders error message json'
    end
  end
end
