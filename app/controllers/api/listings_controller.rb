module Api
  class ListingsController < ApiController

    def index
      @listings = Listing.all
      render json: @listings
    end

    def show
      @listing = Listing.find(params[:id])

      if @listing
        render json: @listing
      else
        render json: @listing.errors.full_messages,
                      status: :unprocessable_entity
      end
    end

    def create
      @listing = current_user.listings.new(listing_params)

      if @listing.save
        render json: @listing
      else
        render json: @listing.errors.full_messages,
                      status: :unprocessable_entity
      end
    end

    def update
      @listing = Listing.find(params[:id])

      if @listing.update_attributes(listing_params)
        render json: @listing
      else
        render json: @listing.errors.full_messages,
                      status: :unprocessable_entity
      end
    end

    def destroy
      @listing = Listing.find(params[:id])
      if @listing.destroy
        render json: { message: 'destroyed!' }
      else
        render json: @listing.errors.full_messages,
                      status: :unprocessable_entity
      end
    end

    private
    def listing_params
      params.require(:listing).
        permit(:title, :description, :latitude, :longitude, :address)
    end
  end
end
