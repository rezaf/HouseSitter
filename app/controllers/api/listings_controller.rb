module Api
  class ListingsController < ApiController
    def index
      @listings = 'need to fill more info'
      render json: @listings
    end
  end
end
