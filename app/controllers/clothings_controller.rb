class ClothingsController < ApplicationController

  def show
    @booking = Booking.new
    @clothing = Clothing.find(params[:id])
  end 

  def index
    @clothings = Clothing.all
  end
end
