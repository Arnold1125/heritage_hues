class ClothingsController < ApplicationController

  def show
    @booking = Booking.new
    @clothing = Clothing.find(params[:id])
  end 
end
