class ClothingsController < ApplicationController
  def show
    @booking = Booking.new
    @clothing = Clothing.find(params[:id])
  end

  def index
    @clothings = Clothing.all

    @markers = @clothings.geocoded.map do |clothing|
      {
        lat: clothing.latitude,
        lng: clothing.longitude
      }
    end
  end
end
